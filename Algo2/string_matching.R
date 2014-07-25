## This Script makes the binary search tree
library("stringdist")
source("Algo2/fnsAlgorithms02.R")

string1 = "ABCDEF"
string2 = "ABCEFGH"

stringdist(string1, string2)

string1 = c("A", "B", "C", "D", "E", "F", "A", "G", "H", "I")
string2 = c("A", "B", "Q", "E", "F", "G", "H")

string1 = c("A", "D", "E")
string2 = c("A", "B", "D")

string1 = c("A", "D")
string2 = c("A", "B")

string1 = c("A")
string2 = character()

string1 = c("101",  "909",  "101",  "909",  "1212", "1010", "1111", "707",  "505",  "1111") 
string2 = c("101",  "909",  "101",  "909",  "1212", "1010", "1111", "707",  "505",  "1111", "303") 

# 
A = 0
A1 = 0
a = MatchVectors(string1, string2, sub_score = .5)
a
A
A1
 
dist_matrix
match_matrix = rep()


