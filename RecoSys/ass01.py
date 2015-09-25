import pandas as pd
import numpy
file_name = "/home/alex/Learning/Data/RecoSys/Ass01/ratings.csv"

ratings = pd.read_csv(file_name)

rating_non = (ratings == ratings) #.as_matrix()

test = numpy.zeros(shape=21)
#print test
#print ratings.shape
for i in range(ratings.shape[0]):
       #print i
       print rating_non[[1]]
       print rating_non[[i]]
       test[i] = (rating_non[[i]].as_matrix() & (rating_non[[1]].as_matrix() == rating_non[[i]].as_matrix() ) ).sum()

#print test
test1 = pd.Series(test, index = ratings.columns.values)
#print ratings.columns.values
#test1.reindex(ratings.columns.values)
test1.sort()
print test1
