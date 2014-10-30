import csv
import numpy

# f =  open('/home/alex2/Learning/Data/Algo2/jobs.txt', 'rb')
f =  open('C:/Users/Alex/Learning/Data/Algo2/Ass03/knapsack_big.txt', 'rb')

reader = (list(csv.reader(f,  delimiter=' ')))

size = int(reader[0][0])
items = int(reader[0][1])

item_value = numpy.asarray([int(reader[i][0]) for i in range(1, items  +1)])
item_size = numpy.asarray([int(reader[i][1]) for i in range(1, items  +1)])

def knapsack(size, item_value, item_size):
    
    items = len(item_value)
    dummy_value = item_value
    
    item_value = item_value[dummy_value.argsort()]
    item_size = item_size[dummy_value.argsort()]
    item_value = item_value[(-item_size).argsort()]
    item_size = item_size[(-item_size).argsort()]
    
    knap_vector_prev = [0 for i in range(size)]
    i = 1
      
    for i in range(items):
        
        print i
        knap_vector_current = knap_vector_prev
        
        for j in range(item_size[i], size):
            if(item_value[i] >= knap_vector_current[j]):
                
                knap_vector_current[j] = item_value[i]
                
                if ( j<size ):
                    
                    vec1 = knap_vector_current[ (j+1):(size)]
                    vec2 = item_value[i] + knap_vector_prev[ (j-item_size[i] +1): (size-j) ]
                    
                    test = vec2 < vec1
                    
                    max_vector = [max(vec1[i],vec2[i]) for i in range(len(vec1))]
                    
                    knap_vector_current[ (j+1):(size)] = max_vector
                
                break
            
        knap_vector_prev = knap_vector_current  
    return knap_vector_prev

    
    
    

A = knapsack(size, item_value, item_size)

print A[-1]

    
    
