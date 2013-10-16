import sys
import Crypto

BLOCK_SIZE = 1024
def strxor(a, b):     # xor two strings of different lengths
    if len(a) > len(b):
        return "".join([chr(ord(x) ^ ord(y)) for (x, y) in zip(a[:len(b)], b)])
    else:
        return "".join([chr(ord(x) ^ ord(y)) for (x, y) in zip(a, b[:len(a)])])
        
        zip("0010".decode("hex"), "0104".decode("hex"))

def read_file(filename):    
    f = open(filename, "rb")
    blocks = []
    b = f.read(BLOCK_SIZE)
    while b:
        blocks.append(b)
        b = f.read(BLOCK_SIZE)
    return blocks
    
def hash_block(block):
    h = SHA256.new()
    h.update(block)
    return h.digest()
    
if __name__=='__main__':
	from Crypto.Hash import SHA256
	
	fileBlocks = read_file('answer.mp4')
	a = len(fileBlocks) -1
	
	print(a)	
	startBlock = fileBlocks[a]
	print len(startBlock)
	current_hash = hash_block(startBlock)
	print current_hash.encode('hex')
	
	#second_block = fileBlocks[a-1] + current_hash
	#second_hash = hash_block(second_block)
	#print second_hash.encode('hex')
	
	
	blockRange = list(reversed(range(0, a)))
	print blockRange[0]
	for i in blockRange:
		currentBlock = fileBlocks[i] + current_hash
		current_hash = hash_block(currentBlock)
	
	print current_hash.encode('hex')
		

	
	
	
		
    
