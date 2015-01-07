# devtools::install_github(rep = "crubba/Rwebdriver")
library(Rwebdriver)

library(XML)
library(stringr)
library(wordcloud)

system("java -jar ~/Learning/Data/Internet/selenium-server-standalone-2.44.0.jar", wait=F)
start_session(root = "http://localhost:4444/wd/hub/", browser = "firefox")

dirpath = "~/Learning/Data/Internet/Queens_Speeches"
dir.create(, showWarnings = F)

i = 1952

for(i in 1952:2001){
  post.url(str_c("http://www.royal.gov.uk/ImagesandBroadcasts/TheQueensChristmasBroadcasts/ChristmasBroadcasts/ChristmasBroadcast", i, ".aspx"))
  page.source <- page_source()
  parsed.html <- htmlParse(page.source)
  speech <- xpathSApply(parsed.html, '//div[@id="content"]/p', xmlValue)
  speech_shortened <- speech[2:length(speech)]
  write(speech_shortened, str_c(dirpath, "/", i, ".txt"))
}