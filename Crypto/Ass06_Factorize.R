require("gmp")
require("stringr")
require("parallel")

long_division <- function(comp)
{
  char_comp = as.bigz(comp)
  char_split = str_split(char_comp, "")[[1]]
  if((length(char_split)%%2 == 1)) char_split = char_split[-1]
    
  A = matrix(char_split, ncol = 2, byrow=T)
  
  q = (as.numeric(apply(A, 1, paste0, collapse = "")))
  current_root = as.bigz(0)
  rem = 0
  i = 1
  j = 1
  
  for(i in 1:length(q))
#   for(i in 1:77)
  {
    current = (as.bigz(q[i]) + (rem * 100) ) 
    for(j in 1:10)
    {
      test = ((current_root * 20) + j) * j
      if(test > current  ) break
    }
    
    top = j - 1
    rem = current - ((current_root * 20) + top) * top
    current_root = current_root * 10 + top
    
  }
  current_root
}


## Question 1
comp = as.bigz("179769313486231590772930519078902473361797697894230657273430081157732675805505620686985379449212982959585501387537164015710139858647833778606925583497541085196591615128057575940752635007475935288710823649949940771895617054361149474865046711015101563940680527540071584560878577663743040086340742855278549092581")
sqrt_comp = long_division(comp)
average = sqrt_comp + 1
sqr_diff = (average)**2 - comp
test = long_division(sqr_diff)

answer = comp/ (average - test)
print(answer)
print(denominator(answer))

## Question 2
comp = as.bigz("648455842808071669662824265346772278726343720706976263060439070378797308618081116462714015276061417569195587321840254520655424906719892428844841839353281972988531310511738648965962582821502504990264452100885281673303711142296421027840289307657458645233683357077834689715838646088239640236866252211790085787877")
sqrt_comp = long_division(comp)

max = 2 ^ 20
# max = 2 ^ 10

A = mclapply(1:max, function(i)
{
  average = sqrt_comp + i
  sqr_diff = (average)**2 - comp
  test = long_division(sqr_diff)
  answer = comp/ (average - test)
  if(denominator(answer) == 1) return("Success") else return("failure")
  
}, mc.cores = 4, mc.preschedule = F, mc.silent = F)

# save(A, file = "test.Rdata")
# which(unlist(A) != "failure")
# print(answer)
# print()

## Question 3
isprime(1048571)
p = 1048571
p * 3/2
isprime(1572869)

q = 1572869
(3*p - 2*q)
(3*p + 2*q)/2
ld = long_division(6*p*q)

R = long_division((ld + 1)*(ld) - p*q*6)

(ld-R)/2
(ld+R+1)/3
(ld-R)/3
(ld+R+1)/2

comp = as.bigz("720062263747350425279564435525583738338084451473999841826653057981916355690188337790423408664187663938485175264994017897083524079135686877441155132015188279331812309091996246361896836573643119174094961348524639707885238799396839230364676670221627018353299443241192173812729276147530748597302192751375739387929")
comp2 = (6 * comp)
sqrt_comp = long_division(comp2)

R = long_division((sqrt_comp+1)*(sqrt_comp) - comp2)

(sqrt_comp - R)/2
(sqrt_comp + R +1)/3
p1 = (sqrt_comp - R)/3
q1 = (sqrt_comp + R +1)/2

as.bigz(p1 * q1) - comp
Q = (sqrt_comp+1)/2
A
