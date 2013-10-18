require("gmp")

p = as.bigz(13407807929942597099574024998205846127479365820592393377723561443721764030073546976801874298166903427690031858186486050853753882811946569946433649006084171)

A = gmp::factorize(p)
isprime(p)

?factorize
g = as.bigz(11717829880366207009516117596335367088558084999998952205599979459063929499736583746670572176471460312928594829675428279466566527115212748467589894601965568)
h = as.bigz(3239475104050450443565264378728065788649097520952449527834792452971981976143292558073856937958553180532878928001494706097394108577585732452307673444020333)
B = 2 ^ 20

modInverse = function(number, base)
{
  gcdex(number, base)[2]
  
}

# modPower = function(number, power, base)
# {
#   inBits = intToBits(power)
#   z = as.bigz(1)
#   y = as.bigz(number)
#   modulus(y) = as.bigz(base)
#   i  = 0
#   for(i in 0:20)
#   {
#     if(inBits[i+1] == 01)
#       z = z * y
#     y = (y*y)
#   }
#   return(z)
# }
  
A = list()
x = 1
g_x = g
modulus(g_x) = p
 
while(x < B)
{
  (g * g) %/% (p)
  
  isprime()
  
  g_x =
  x = x +1
}

#   g_x = modPower(g, x, p)
#   gInv = modInverse(g_x, p)
#   answer = h * gInv
#   modulus(answer) = p
#   A[[x]] = answer
#   x = x+1
# }

x = 1
g_B = modPower(g, B, p)

modPower(g, B, p)

modPower(3, 4, 5)

while(x < B)

