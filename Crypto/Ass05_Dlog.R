require("gmp")

p = as.bigz("13407807929942597099574024998205846127479365820592393377723561443721764030073546976801874298166903427690031858186486050853753882811946569946433649006084171")

g = as.bigz("11717829880366207009516117596335367088558084999998952205599979459063929499736583746670572176471460312928594829675428279466566527115212748467589894601965568")
h = as.bigz("3239475104050450443565264378728065788649097520952449527834792452971981976143292558073856937958553180532878928001494706097394108577585732452307673444020333")
B = as.bigz(2 ^ 20)

modulus(g) = modulus(h) = p


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
  for(i in 0:20)
  {
    if(inBits[i+1] == 01)
      z = z * y
    y = (y*y)
  }
  return(z)
}
  
p = 61
isprime(61)
g = as.bigz(59, p)
g^57
h = (g^38)
B = 2^3



leftHash = rep(NA, times= as.numeric(B))
g_x = 1

for(x in 1:as.numeric(B))
{
  g_x = g_x * g
  gInv = modInverse(g_x, p)
  output = (h * gInv) %% p
  modulus(output) = NULL
  leftHash[x] = as.character(output)
}

# leftHash 

# load("leftHash.Rdata")
####
g_b = g^B
g_b_x = 1

rightHash = rep(NA, times= as.numeric(B))

for(x in 1:as.numeric(B))
{
  g_b_x = g_b_x * g_b
  modulus(g_b_x) = NULL
  output = as.character(g_b_x)
  rightHash[x] = output
  
}

leftHash
rightHash

q = which(rightHash %in% leftHash)
q

q1 = which(leftHash == rightHash[q])

B * q + q1


