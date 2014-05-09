# Comparing normal and strassen Multiplication
M1 = matrix( c(1:16), 4, byrow=T)

M1_A = M2_A = matrix(c(1, 2, 5, 6), 2, byrow = T)
M1_B = M2_B = matrix(c(3, 4, 7, 8), 2, byrow = T)
M1_C = M2_C = matrix(c(9, 10, 13, 14), 2, byrow = T)
M1_D = M2_D = matrix(c(11, 12, 15, 16), 2, byrow = T)

# by normal multiplication
M3_A_normal = M1_A%*%M1_A + M1_B%*%M2_C


# by strassen = P5 + P4 - P2 + P6
P5 = (M1_A + M1_D)%*%(M2_A + M2_D)
P4 = (M1_D)%*%(M2_C - M2_A)
P2 = (M1_A + M1_B)%*%(M2_D)
P6 = (M1_B - M1_D)%*%(M2_C + M2_D)

(M3_A_strassen =  P5 + P4 - P2 + P6)

print(M1)
print(M1 %*% M1)
print(M3_A_normal)
print(M3_A_strassen)

####
M1 = matrix(c(1:9), 3, byrow=T)
M1%*%M1

M2 = cbind(rbind(M1, 0),0)
M2%*%M2

