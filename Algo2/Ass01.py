import sys
import csv



f =  open('/home/alex2/Learning/Data/Algo2/jobs.txt', 'rb')
reader = list(csv.reader(f,  delimiter=' '))

total = 0

print len(reader)

print range(0, len(reader))
print reader[2]

for i in range(1, len(reader)):
    total = total + int(reader[i][1])
    
    
    
print(total)
#print sum(chr.reader[i] for i in [1, 2, 3])
