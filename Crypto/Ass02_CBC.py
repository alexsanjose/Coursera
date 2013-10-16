import sys
import Crypto

CT =  "4ca00ff4c898d61e1edbf1800618fb2828a226d160dad07883d04e008a7897ee2e4b7465d5290d0c0e6c6822236e1daafb94ffe0c5da05d9476be028ad7c1d81"
IV =  "4ca00ff4c898d61e1edbf1800618fb28"
#CT =  "28a226d160dad07883d04e008a7897ee"
key = "140b41b22a29beb4061bda66b6747e14"
testmsg = "testthisthingout"

key = "140b41b22a29beb4061bda66b6747e14"
CT =  "b4832d0f26e1ab7da33249de7d4afc48e713ac646ace36e872ad5fb8a512428a6e21364b0c374df45503473c5242a253"
IV = "5b68629feb8606f9a6667670b75b38a5"

key = "36f18357be4dbd77f050515c73fcf9f2"
CT =  "0ec7702330098ce7f7520d1cbbb20fc388d1b0adb5054dbd7370849dbf0b88d393f252e764f1f5f7ad97ef79d59ce29f5f51eeca32eabedd9afa9329"
IV = "69dda8455c7dd4254bf353b773304eec"

key = "36f18357be4dbd77f050515c73fcf9f2"
CT =  "e46218c0a53cbeca695ae45faa8952aa0e311bde9d4e01726d3184c34451"
IV =  "770b80259ec33beb2561358a9f2dc617"

def strxor(a, b):     # xor two strings of different lengths
    if len(a) > len(b):
        return "".join([chr(ord(x) ^ ord(y)) for (x, y) in zip(a[:len(b)], b)])
    else:
        return "".join([chr(ord(x) ^ ord(y)) for (x, y) in zip(a, b[:len(a)])])
        
        zip("0010".decode("hex"), "0104".decode("hex"))

    
if __name__=='__main__':
	#print "test"
	#key = b'Sixteen byte key'
	#ciphertexts = [key.decode('hex'), CT.decode('hex')]
	from Crypto.Cipher import AES
	from Crypto.Util import Counter
	
	#ctr = Counter.new(IV.decode('hex'))
	
	#IV2 = array.array('B', IV.decode("hex")).tostring()
	#IV2 =  array('B', IV.decode("hex"))
	print(long(IV, 16))
	ctr = Crypto.Util.Counter.new(128, initial_value=long(IV, 16))
	cipher = AES.new(key.decode('hex'), AES.MODE_CTR, counter = ctr)
	
	
	#cipher = AES.new(key.decode('hex'), AES.MODE_ECB)
	#cipT = IV.decode('hex') + cipher.encrypt(testmsg)
	
	#print cipher.encrypt(testmsg)
	#print(key)
	#print(IV)
	
	#output = cipher.decrypt(CT.decode('hex'))
	#print strxor(output, IV)
	print cipher.decrypt(CT.decode('hex'))
	
	#print ciphertexts
	
	
	
		
    
