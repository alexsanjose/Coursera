import sys
import csv



with open('/home/alex2/Learning/Data/Algo2/jobs.txt', 'rb') as f:
    reader = list(csv.reader(f))
    row_count = sum(1 for row in reader)

print len(reader)

print range(0, len(reader))
print reader[2]
print sum(reader[i] for i in range(0, len(reader)))
