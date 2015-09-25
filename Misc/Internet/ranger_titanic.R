# preparation and data reading section
library(ranger)
options(stringsAsFactors = F)
#https://www.reddit.com/r/MachineLearning/comments/3hvy7v/ranger_a_fast_implementation_of_random_forests/
library(lattice)
library(latticeExtra)
# has cross validation
library(ipred)

# read and combine
train <- read.csv("../Data/Internet/Titanic/train.csv")
train$status <- 'train'
test  <- read.csv('../Data/Internet/Titanic/test.csv')
test$status <- 'test'
test$Survived <- NA
tt <- rbind(test,train)

# generate variables
tt$Embarked[tt$Embarked==''] <- 'S'
tt$Embarked <- factor(tt$Embarked)
tt$Pclass <- factor(tt$Pclass)
tt$Survived <- factor(tt$Survived)
tt$Title <- sapply(tt$Name,function(x) strsplit(as.character(x),'[.,]')[[1]][2])
tt$Title <- gsub(' ',"",tt$Title)
tt$Title[tt$Title=='Dr' & tt$Sex=='female'] <- 'Miss'
tt$Title[tt$Title %in% c('Capt','Col','Don','Sir','Jonkheer',
       'Major','Rev','Dr')] <- 'Mr'
tt$Title[tt$Title %in% c('Lady','Ms',
       'theCountess','Mlle','Mme','Ms','Dona')] <- 'Miss'
tt$Title <- factor(tt$Title)
# changed cabin character
tt$cabchar <- substr(tt$Cabin,1,1)
tt$cabchar[tt$cabchar %in% c('F','G','T')] <- 'X';
tt$cabchar <- factor(tt$cabchar)
tt$ncabin <- nchar(as.character(tt$Cabin))
tt$cn <- as.numeric(gsub('[[:space:][:alpha:]]','',tt$Cabin))
tt$oe <- factor(ifelse(!is.na(tt$cn),tt$cn%%2,-1))
tt$Fare[is.na(tt$Fare)]<- median(tt$Fare,na.rm=TRUE)
tt$ticket <- sub('[[:digit:]]+$',"",tt$Ticket)
tt$ticket <- toupper(gsub('(\\.)|( )|(/)','',tt$ticket))
tt$ticket[tt$ticket %in% c('A2','A4','AQ3','AQ4','AS')] <- 'An'
tt$ticket[tt$ticket %in% c('SCA3','SCA4','SCAH','SC','SCAHBASLE','SCOW')] <- 'SC'
tt$ticket[tt$ticket %in% c('CASOTON','SOTONO2','SOTONOQ')] <- 'SOTON'
tt$ticket[tt$ticket %in% c('STONO2','STONOQ')] <- 'STON'
tt$ticket[tt$ticket %in% c('C')] <- 'CA'
tt$ticket[tt$ticket %in% c('SOC','SOP','SOPP')] <- 'SOP'
tt$ticket[tt$ticket %in% c('SWPP','WC','WEP')] <- 'W'
tt$ticket[tt$ticket %in% c('FA','FC','FCC')] <- 'F'
tt$ticket[tt$ticket %in% c('PP','PPP','LINE','LP','SP')] <- 'PPPP'
tt$ticket <- factor(tt$ticket)

tt$Sex = factor(tt$Sex)
#end of preparation and data reading

# age section
# get an age without missings
forage <- tt[!is.na(tt$Age) & tt$status=='train',
    names(tt) %in% c('Age','Sex','Pclass','SibSP',
         'Parch','Fare','Title','Embarked','cabchar','ncabin','ticket')]
# oe is side of vessel, not relevant for age?

totest <- expand.grid(mtry=1:2,min.node.size=1:10,rep=1:2)

la <- lapply(1:nrow(totest),function(ii) {
  print(ii)
  ee <- errorest(Age ~ .,
     mtry=totest$mtry[ii],
     min.node.size=totest$min.node.size[ii],
     model=ranger,
     predict=function(object,newdata) 
       predict(object,data=newdata)$predictions,
     write.forest=TRUE,
     data=forage)
  cc <- c(mtry=totest$mtry[ii],
    min.node.size=totest$min.node.size[ii],
    error=ee$error)
  #  print(cc)
  cc
})
sla <- do.call(rbind,la)
sla <- as.data.frame(sla)

# 2,7?
rfa1 <- ranger(Age ~ .,
      data=forage,
      mtry=2,
      write.forest=TRUE,
      min.node.size=7)

tt$AGE <- tt$Age
tt$AGE[is.na(tt$AGE)] <- predict(rfa1,tt[is.na(tt$AGE),])$predictions
# end of age section

#final data section
train <- tt[tt$status=='train',]
test <- tt[tt$status=='test',]
#end of final data section

#model selection 1
forSurf <- train[,names(train) %in% c('Survived','AGE','Sex','Pclass','SibSP',
           'Parch','Fare','Title','Embarked','ncabin','ticket','oe')]

totest <- expand.grid(mtry=2:5,
       min.node.size=c(15,20,25),rep=1:2)

la2 <- lapply(1:nrow(totest),function(ii) {
  ee <- errorest(Survived ~.,
     mtry=totest$mtry[ii],
     min.node.size=totest$min.node.size[ii],
     model=ranger,
     predict=function(object,newdata) 
       predict(object,data=newdata)$predictions,
     write.forest=TRUE,
     data=forSurf
  )
  cc <- c(mtry=totest$mtry[ii],
          min.node.size=totest$min.node.size[ii],
          error=ee$error)
  cat('.')
  if (totest$mtry[ii]==max(totest$mtry) & 
      totest$min.node.size[ii]==max(totest$min.node.size)) 
    cat('n')
  cc
})
sla2 <- do.call(rbind,la2)
sla2 <- as.data.frame(sla2)

totest <- expand.grid(num.trees=c(50,500,5000),rep=1:10)

la3 <- lapply(1:nrow(totest),function(ii) {
  ee <- errorest(Survived ~.,
     mtry=4,
     min.node.size=12,
     num.trees=totest$num.trees[ii],
     model=ranger,
     predict=function(object,newdata) 
       predict(object,data=newdata)$predictions,
     write.forest=TRUE,
     data=forSurf
  )
  cc <- c(num.trees=totest$num.trees[ii],error=ee$error)
  cat('.')
  if (totest$num.trees[ii]==max(totest$num.trees)) cat('n')
  cc
})
sla3 <- do.call(rbind,la3)
sla3 <- as.data.frame(sla3)
densityplot(~ error | factor(num.trees), data=sla3)

#########
rang3 <- ranger(Survived ~ .,
    mtry=4,
    min.node.size=12,
    write.forest=TRUE,
    data=forSurf,
    num.trees=200) 

pp <- predict(rang3,test)
out <- data.frame(
  PassengerId=test$PassengerId,
  Survived=pp$predictions,row.names=NULL)
write.csv(x=out,
    file='rf.1.sep.csv',
    row.names=FALSE,
    quote=FALSE)

# Your submission scored 0.75598, which is not an improvement of your best score.