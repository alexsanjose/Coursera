import urllib2
import sys

def chunks(l, n):
    return [l[i:i+n] for i in range(0, len(l), n)]
    
testCT = "f20bdba6ff29eed7b046d1df9fb7000058b1ffb4210a580f748b4ac714c001bd4a61044426fb515dad3f21f18aa577c0bdf302936266926ff37dbf7035d5eeb4"

TARGET = 'http://crypto-class.appspot.com/po?er='
#--------------------------------------------------------------
# padding oracle
#--------------------------------------------------------------
class PaddingOracle(object):
    def query(self, q):
        target = TARGET + urllib2.quote(q)    # Create query URL
        #print target
        req = urllib2.Request(target)         # Send HTTP request to server
        try:
            f = urllib2.urlopen(req)          # Wait for response
        except urllib2.HTTPError, e:          
            #print "We got: %d" % e.code       # Print response code
            if e.code == 404:
				print "We got: %d" % e.code       # Print response code
				return True # good padding
            return False # bad padding


def strxor(a, b):     # xor two strings of different lengths
    if len(a) > len(b):
        return "".join([chr(ord(x) ^ ord(y)) for (x, y) in zip(a[:len(b)], b)])
    else:
        return "".join([chr(ord(x) ^ ord(y)) for (x, y) in zip(a, b[:len(a)])])
        
        
if __name__ == "__main__":
    po = PaddingOracle()
    
    
    blocks = chunks(testCT, 32)
    IV = blocks[0].decode('hex')
    test = blocks[0].decode('hex')
    CT = blocks[1].decode('hex')
    
    print test.encode('hex')
    blockRange = range(30, 140)
    blockRange = range(90, 140)
			
    xor = "00000000000000000000000000000001".decode('hex')
    xor = "00000000000000000000000000000202".decode('hex')
    xor = "00000000000000000000000000030303".decode('hex')
    xor = "00000000000000000000000004040404".decode('hex')
    xor = "00000000000000000000000505050505".decode('hex')
    xor = "00000000000000000000060606060606".decode('hex')
    #xor = "00000000000000000007070707070707".decode('hex')
    #xor = "00000000000000000808080808080808".decode('hex')
    #xor = "00000000000000090909090909090909".decode('hex')
    #xor = "00000000000000090909090909090909".decode('hex')
    #xor = "00000000000000090909090909090909".decode('hex')
    #xor = "0000000000000a0a0a0a0a0a0a0a0a0a".decode('hex')
    #xor = "00000000000b0b0b0b0b0b0b0b0b0b0b".decode('hex')
    #xor = "000000000c0c0c0c0c0c0c0c0c0c0c0c".decode('hex')
    #xor = "0000000d0d0d0d0d0d0d0d0d0d0d0d0d".decode('hex')
    #xor = "00000e0e0e0e0e0e0e0e0e0e0e0e0e0e".decode('hex')
    #xor = "000f0f0f0f0f0f0f0f0f0f0f0f0f0f0f".decode('hex')
    #xor = "10101010101010101010101010101010".decode('hex')
    
    
    
    print test.encode('hex')
    print xor
    print strxor(test, xor).encode('hex')
    
    for g in blockRange:
		xorString = strxor("00".decode('hex') + chr(g) + "72652053717565616d697368204f73".decode('hex')  , xor) 
		#xorString = strxor("".decode('hex') + chr(g) + "72652053717565616d697368204f73".decode('hex')  , xor) 
		xorString = strxor("00000000000000000000".decode('hex') + chr(g) + "6f72647320".decode('hex')  , xor)
		#xorString =strxor("000000000000000000000000000000".decode('hex') + chr(g)  , xor)
		#xorString =strxor("000000000000000000000000000000".decode('hex') + chr(g)  , xor)
		
		query = strxor(test, xorString).encode('hex') + CT.encode('hex')
		
		#print query
		print g
		A = po.query(query)       # Issue HTTP query with the given argument
		if (A == True):
			 print chr(g).encode('hex')
			 print chr(g)
			 break
		
	
		#if g == 3 then print g
		
			
    
    
