import csv
import numpy
# f =  open('/home/alex2/Learning/Data/Algo2/jobs.txt', 'rb')
f =  open('C:/Users/Alex/Learning/Data/Algo2/jobs.txt', 'rb')

reader = list(csv.reader(f,  delimiter=' '))

jobs_weight = numpy.array([int(reader[i][0]) for i in range(1, len(reader))])
jobs_length = numpy.array([int(reader[i][1]) for i in range(1, len(reader))])

greed = jobs_weight - jobs_length

temp = greed.argsort()
ranks = numpy.empty(len(array), int)
ranks[temp] = numpy.arange(len(array))

#print sum(chr.reader[i] for i in [1, 2, 3])
