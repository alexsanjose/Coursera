import gmpy2


p = gmpy2.mpz(13407807929942597099574024998205846127479365820592393377723561443721764030073546976801874298166903427690031858186486050853753882811946569946433649006084171)
g = gmpy2.mpz(11717829880366207009516117596335367088558084999998952205599979459063929499736583746670572176471460312928594829675428279466566527115212748467589894601965568)
h = gmpy2.mpz(3239475104050450443565264378728065788649097520952449527834792452971981976143292558073856937958553180532878928001494706097394108577585732452307673444020333)
B = 2 ** 20

print p
print B

def modInv(num, base):
    return gmpy2.gcdext(num, base)[1]


  
p = 61

# isprime(61)

g = gmpy2.mpz(59)

(g**57) % p

h = (g ** 38) % p

B = 2**3


leftHash = [] 
#leftHash = rep(NA, times= as.numeric(B))
g_x = 1

totRange = range(0, B)
# 
for x in totRange:
    g_x = (g_x * g) % p
    gInv = modInv(g_x, p)
    output = (h * gInv) % p
    leftHash.extend([output])

g_b = g ** B
g_b_x = 1

rightHash = []

for x in totRange:
    g_b_x = (g_b_x * g_b) % p
    rightHash.extend([g_b_x])

leftHash

rightHash

A = [i in leftHash for i in rightHash]

A1 = A.index(True)

A2 = leftHash.index(rightHash[A1])

(B * (A1+1) + (A2+1) ) % p
    
    
    
    