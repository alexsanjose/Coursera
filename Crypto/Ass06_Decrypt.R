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

modInverse = function(number, base)
{
  gcdex(number, base)[2]
  
}


modPower = function(number, power, base)
{
  inBits = intToBits(power)
  
  z = as.bigz(1)
  y = as.bigz(number)
  modulus(y) = as.bigz(base)
  i  = 0
  for(i in 0:(length(inBits) +1))
  {
    if(inBits[i+1] == 01)
      z = z * y
    y = (y*y)
  }
  return(z)
}


## Question 1
comp = as.bigz("179769313486231590772930519078902473361797697894230657273430081157732675805505620686985379449212982959585501387537164015710139858647833778606925583497541085196591615128057575940752635007475935288710823649949940771895617054361149474865046711015101563940680527540071584560878577663743040086340742855278549092581")
sqrt_comp = long_division(comp)
average = sqrt_comp + 1
sqr_diff = (average)**2 - comp
test = long_division(sqr_diff)

answer = as.bigz(comp/ (average - test))
print(answer)
print(denominator(answer))

CT = as.bigz("22096451867410381776306561134883418017410069787892831071731839143676135600120538004282329650473509424343946219751512256465839967942889460764542040581564748988013734864120452325229320176487916666402997509188729971690526083222067771600019329260870009579993724077458967773697817571267229951148662959627934791540")

phi = (answer-1)*(average-test-1)
modulus
e = 65537
d = modInverse(e, phi)
modulus(d) = phi
modulus(d) = NULL

msg = powm(CT, d, comp)

test = powm(msg, e, comp)


class(msg) = "hexmode"
msg


A = as.bigz(msg)


number = CT


####
comp = 17 * 23
e = 3
phi = 16 * 22
d = modInverse(e, phi)
modulus(d) = phi
d
modulus(d) = NULL

d
msg = 50

CT = modPower(msg, e, comp)
CT = pow.bigz(msg, e)

# d = as.numeric(d)

as.raw(235)


msg = modPower(CT, d, comp)
msg = powm(CT, d, comp)
modulus(msg) = comp
msg

CT * CT 

