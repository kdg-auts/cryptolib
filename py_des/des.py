#-*- coding: utf8 -*-

### DES algorithm implementation
### NOT for practical use
DEBUG = True

# Initial permutation (IP) for the input data block
PI = [58, 50, 42, 34, 26, 18, 10, 2,
      60, 52, 44, 36, 28, 20, 12, 4,
      62, 54, 46, 38, 30, 22, 14, 6,
      64, 56, 48, 40, 32, 24, 16, 8,
      57, 49, 41, 33, 25, 17,  9, 1,
      59, 51, 43, 35, 27, 19, 11, 3,
      61, 53, 45, 37, 29, 21, 13, 5,
      63, 55, 47, 39, 31, 23, 15, 7]


# Final permutation (IP**-1) for cipherblock after the 16 rounds
PI_1 = [40, 8, 48, 16, 56, 24, 64, 32,
        39, 7, 47, 15, 55, 23, 63, 31,
        38, 6, 46, 14, 54, 22, 62, 30,
        37, 5, 45, 13, 53, 21, 61, 29,
        36, 4, 44, 12, 52, 20, 60, 28,
        35, 3, 43, 11, 51, 19, 59, 27,
        34, 2, 42, 10, 50, 18, 58, 26,
        33, 1, 41,  9, 49, 17, 57, 25]


# Initial permutation (CP1) for the key expansion
CP_1 = [57, 49, 41, 33, 25, 17,  9,
         1, 58, 50, 42, 34, 26, 18,
        10,  2, 59, 51, 43, 35, 27,
        19, 11,  3, 60, 52, 44, 36,
        63, 55, 47, 39, 31, 23, 15,
         7, 62, 54, 46, 38, 30, 22,
        14,  6, 61, 53, 45, 37, 29,
        21, 13,  5, 28, 20, 12,  4]

# Round key permutation (CP2) to get Ki+1
CP_2 = [14, 17, 11, 24,  1,  5,  3, 28,
        15,  6, 21, 10, 23, 19, 12,  4,
        26,  8, 16,  7, 27, 20, 13,  2,
        41, 52, 31, 37, 47, 55, 30, 40,
        51, 45, 33, 48, 44, 49, 39, 56,
        34, 53, 46, 42, 50, 36, 29, 32]

# Expansion tramsformation for data block R before XOR with Ki
E = [32,  1,  2,  3,  4,  5,
      4,  5,  6,  7,  8,  9,
      8,  9, 10, 11, 12, 13,
     12, 13, 14, 15, 16, 17,
     16, 17, 18, 19, 20, 21,
     20, 21, 22, 23, 24, 25,
     24, 25, 26, 27, 28, 29,
     28, 29, 30, 31, 32,  1]

# Set of S-Boxes S1 - S8 
S_BOX = [
         
[[14, 4, 13, 1, 2, 15, 11, 8, 3, 10, 6, 12, 5, 9, 0, 7],
 [0, 15, 7, 4, 14, 2, 13, 1, 10, 6, 12, 11, 9, 5, 3, 8],
 [4, 1, 14, 8, 13, 6, 2, 11, 15, 12, 9, 7, 3, 10, 5, 0],
 [15, 12, 8, 2, 4, 9, 1, 7, 5, 11, 3, 14, 10, 0, 6, 13],
],

[[15, 1, 8, 14, 6, 11, 3, 4, 9, 7, 2, 13, 12, 0, 5, 10],
 [3, 13, 4, 7, 15, 2, 8, 14, 12, 0, 1, 10, 6, 9, 11, 5],
 [0, 14, 7, 11, 10, 4, 13, 1, 5, 8, 12, 6, 9, 3, 2, 15],
 [13, 8, 10, 1, 3, 15, 4, 2, 11, 6, 7, 12, 0, 5, 14, 9],
],

[[10, 0, 9, 14, 6, 3, 15, 5, 1, 13, 12, 7, 11, 4, 2, 8],
 [13, 7, 0, 9, 3, 4, 6, 10, 2, 8, 5, 14, 12, 11, 15, 1],
 [13, 6, 4, 9, 8, 15, 3, 0, 11, 1, 2, 12, 5, 10, 14, 7],
 [1, 10, 13, 0, 6, 9, 8, 7, 4, 15, 14, 3, 11, 5, 2, 12],
],

[[7, 13, 14, 3, 0, 6, 9, 10, 1, 2, 8, 5, 11, 12, 4, 15],
 [13, 8, 11, 5, 6, 15, 0, 3, 4, 7, 2, 12, 1, 10, 14, 9],
 [10, 6, 9, 0, 12, 11, 7, 13, 15, 1, 3, 14, 5, 2, 8, 4],
 [3, 15, 0, 6, 10, 1, 13, 8, 9, 4, 5, 11, 12, 7, 2, 14],
],  

[[2, 12, 4, 1, 7, 10, 11, 6, 8, 5, 3, 15, 13, 0, 14, 9],
 [14, 11, 2, 12, 4, 7, 13, 1, 5, 0, 15, 10, 3, 9, 8, 6],
 [4, 2, 1, 11, 10, 13, 7, 8, 15, 9, 12, 5, 6, 3, 0, 14],
 [11, 8, 12, 7, 1, 14, 2, 13, 6, 15, 0, 9, 10, 4, 5, 3],
], 

[[12, 1, 10, 15, 9, 2, 6, 8, 0, 13, 3, 4, 14, 7, 5, 11],
 [10, 15, 4, 2, 7, 12, 9, 5, 6, 1, 13, 14, 0, 11, 3, 8],
 [9, 14, 15, 5, 2, 8, 12, 3, 7, 0, 4, 10, 1, 13, 11, 6],
 [4, 3, 2, 12, 9, 5, 15, 10, 11, 14, 1, 7, 6, 0, 8, 13],
], 

[[4, 11, 2, 14, 15, 0, 8, 13, 3, 12, 9, 7, 5, 10, 6, 1],
 [13, 0, 11, 7, 4, 9, 1, 10, 14, 3, 5, 12, 2, 15, 8, 6],
 [1, 4, 11, 13, 12, 3, 7, 14, 10, 15, 6, 8, 0, 5, 9, 2],
 [6, 11, 13, 8, 1, 4, 10, 7, 9, 5, 0, 15, 14, 2, 3, 12],
],
   
[[13, 2, 8, 4, 6, 15, 11, 1, 10, 9, 3, 14, 5, 0, 12, 7],
 [1, 15, 13, 8, 10, 3, 7, 4, 12, 5, 6, 11, 0, 14, 9, 2],
 [7, 11, 4, 1, 9, 12, 14, 2, 0, 6, 10, 13, 15, 3, 5, 8],
 [2, 1, 14, 7, 4, 10, 8, 13, 15, 12, 9, 0, 3, 5, 6, 11],
]
]

# Permutation after S-Box substitution (inside round function)
P = [16, 7, 20, 21, 29, 12, 28, 17,
     1, 15, 23, 26, 5, 18, 31, 10,
     2, 8, 24, 14, 32, 27, 3, 9,
     19, 13, 30, 6, 22, 11, 4, 25]

# Subkey blocks shift before each round key generation
SHIFT = [1,1,2,2,2,2,2,2,1,2,2,2,2,2,2,1]

# Convert a string into an array of bits (list of int) -- only latin, digits and simple symbols allowed!
def string_to_bit_array(text):
    array = list()
    for char in text:
        binval = binvalue(char, 8) # get the code for one char - byte value
        array.extend([int(x) for x in list(binval)]) # add bits to the final list
    return array

# Recreate a string from array of bits (list of int)
def bit_array_to_string(array): 
    res = ''.join([chr(int(y,2)) for y in [''.join([str(x) for x in _bytes]) for _bytes in  nsplit(array,8)]])   
    return res

# Return the binary value as a string of the given size
def binvalue(val, bitsize):
    binval = bin(val)[2:] if isinstance(val, int) else bin(ord(val))[2:]
    if len(binval) > bitsize:
        raise ValueError("Binary value is larger than the expected size (%d)" % bitsize)
    while len(binval) < bitsize:
        binval = "0" + binval # append as many 0 as needed to get the wanted bitsize
    return binval

# Split a list "s" into sublists of size "n"
def nsplit(s, n):
    return [s[k:k+n] for k in range(0, len(s), n)]

ENCRYPT = 1
DECRYPT = 0

class des():
    # init defaults
    def __init__(self):
        self.masterkey = None
        self.message = None
        self.roundkeys = list()
    
    # main algorithm routine (defaults: encrypt with no padding)
    def run(self, key, message, action = ENCRYPT, padding = False):
        # debug messages for convenience and supply debug data for HW implementation
        if DEBUG == True:
            act = "ENCRYPTION" if action == ENCRYPT else "DECRYPTION"
            print(f"### PERFORM {act} PROCESS ###")
        
        # prepare masterkey
        if len(key) < 8:
            raise ValueError("Key should be 8 bytes long! Redefine Key!")
        elif len(key) > 8:
            key = key[:8] # truncate if key size is over 8 bytes
        self.masterkey = key
        self.generatekeys() # generate roundkeys
        
        if DEBUG == True: 
            print("Master Key: %r" % key, ":".join("{:02x}".format(ord(symb)) for symb in key))
            print("Round Keys: ")
            for rk_bit in self.roundkeys:
                rk_str = bit_array_to_string(rk_bit)
                print(":".join("{:02x}".format(ord(symb)) for symb in rk_str))
        
        # prepare message to encrypt/decrypt
        #self.message = message
        if padding and action == ENCRYPT:
            self.message = self.addPadding(message)
        elif len(message) % 8 != 0: # data size must be 8-bytes-multiple
            raise ValueError("Data size in bytes should be multiple of 8! Use padding=True option!")
        else:
            self.message = message
        chunk_set = nsplit(self.message, 8) # split the message into chunks of 8 bytes (64 bits)
        
        # prepare result containers: for round chunk (array of bits) and entire message (string)
        round_result = list()
        final_result = ""
        
        # DEBUG
        DBG_chunk_i = 1

        # loop over all the chunks of message
        for chunk in chunk_set:
            
            if DEBUG == True:
                print(f"## BEGIN PROCESSING CHUNK {DBG_chunk_i}/{len(chunk_set)} ##")
                print("chunk value =", ":".join("{:02x}".format(ord(symb)) for symb in chunk))
            
            chunk = string_to_bit_array(chunk) # convert the chunk data (string) into array of bits (list of int)
            chunk = self.permute(chunk, PI) # apply the initial permutation
            
            if DEBUG == True:
                chunk_str = bit_array_to_string(chunk)
                print("IP_PERM =", ":".join("{:02x}".format(ord(symb)) for symb in chunk_str))
            
            left_half, right_half = nsplit(chunk, 32) # split data state into left half (LH) and right half (RH)
            
            if DEBUG == True:
                left_half_str = bit_array_to_string(left_half)
                right_half_str = bit_array_to_string(right_half)
                print("[L0][R0] =", ":".join("{:02x}".format(ord(symb)) for symb in left_half_str), "=", ":".join("{:02x}".format(ord(symb)) for symb in right_half_str))
            
            tmp = None # data value processed in round Functon
            
            # cycle over all 16 rounds
            for i in range(16):
                if DEBUG == True:
                    print(f"## ROUND {i+1} ##")
                # 1) round Function
                right_half_expanded = self.expand(right_half, E) # expand RH to match Ki size (48 bits)
                if action == ENCRYPT:
                    tmp = self.xor(self.roundkeys[i], right_half_expanded) # if ENCRYPT - use round keys in natural order
                else:
                    tmp = self.xor(self.roundkeys[15-i], right_half_expanded) # if DECRYPT - use round keys in reverse order
                if DEBUG == True:
                    RE_str = bit_array_to_string(right_half_expanded)
                    Ki_str = bit_array_to_string(self.roundkeys[i] if action == ENCRYPT else self.roundkeys[15-i])
                    SBI_str = bit_array_to_string(tmp)
                    print("E(R) =", ":".join("{:02x}".format(ord(symb)) for symb in RE_str))
                    print(f"K{i+1} =", ":".join("{:02x}".format(ord(symb)) for symb in Ki_str))
                    print("SB_IN =", ":".join("{:02x}".format(ord(symb)) for symb in SBI_str))
                tmp = self.substitute(tmp) # substitution using S-Boxes
                if DEBUG == True:
                    SBO_str = bit_array_to_string(tmp)
                    print("SB_OUT =", ":".join("{:02x}".format(ord(symb)) for symb in SBO_str))
                tmp = self.permute(tmp, P) # permutation P after substitution
                if DEBUG == True:
                    P_str = bit_array_to_string(tmp)
                    print("P(SBO) =", ":".join("{:02x}".format(ord(symb)) for symb in P_str))
                tmp = self.xor(left_half, tmp)
                # 2) swap halves
                left_half = right_half
                right_half = tmp
                if DEBUG == True:
                    left_half_str = bit_array_to_string(left_half)
                    right_half_str = bit_array_to_string(right_half)
                    print(f"[L{i+1}][R{i+1}] =", ":".join("{:02x}".format(ord(symb)) for symb in left_half_str), "=", ":".join("{:02x}".format(ord(symb)) for symb in right_half_str))
            # perform final permutation and append processed chunk to result container
            round_result = self.permute(right_half + left_half, PI_1) 
            final_result += bit_array_to_string(round_result)
            
            if DEBUG == True:
                round_result_str = bit_array_to_string(round_result)
                print("IP_INV =", ":".join("{:02x}".format(ord(symb)) for symb in round_result_str))
                print(f"## END PROCESSING CHUNK {DBG_chunk_i}/{len(chunk_set)} ##")
                DBG_chunk_i += 1
        
        if padding and action == DECRYPT:
            return self.removePadding(final_result) # remove the padding in decrypted plaintext
        else:
            return final_result # return the final string of data ciphered/deciphered
    
    # nonlinear substitution using predefined S-Boxes
    def substitute(self, datablock48):
        subblocks = nsplit(datablock48, 6) # split bit array of 48 bits into 8 subarrays of 6 bits
        result = list() # list of 32 result bits
        for i in range(len(subblocks)): # loop over all 8 subarrays
            block = subblocks[i]
            row = int(str(block[0]) + str(block[5]), 2) # get row number as first and last bit concatenated
            column = int(''.join([str(x) for x in block[1:][:-1]]), 2) # get column number as bits [2,3,4,5] 
            val = S_BOX[i][row][column] # pick the output value from S-Box LUT using row and column numbers
            bin = binvalue(val, 4) # convert the value (int) to binary string
            result += [int(x) for x in bin] # convert binary string to array of bits and append it to the resulting list
        return result

    # generic method to perform PERMUTATION according to specified table
    def permute(self, block, table):
        return [block[x-1] for x in table]
    
    # generic method to perform EXPANSION according to specified table (exactly the same as permute())
    def expand(self, block, table):
        return [block[x-1] for x in table]
    
    # bitwise XOR over bit lists
    def xor(self, t1, t2):
        return [x^y for x,y in zip(t1,t2)]
    
    # roundkeys generation routine
    def generatekeys(self):
        self.roundkeys = []
        key = string_to_bit_array(self.masterkey)
        key = self.permute(key, CP_1) # initial keystate permutation
        C, D = nsplit(key, 28) # split keystate to C (LEFT) and D (RIGHT) halves
        for i in range(16): # get all 16 roundkeys
            C, D = self.shift(C, D, SHIFT[i]) # perform left shift for 1 or 2 bits depending on current round
            tmp = C + D # merge keystate halves
            self.roundkeys.append(self.permute(tmp, CP_2)) # perform roundkey permutation PC2 and get Ki

    # left shift each in a couple of lists by given value
    def shift(self, C, D, n): 
        return C[n:] + C[:n], D[n:] + D[:n]
    
    # Add padding to the opentext to be 8-bytes-multiply using PKCS5 method
    def addPadding(self, data):
        pad_len = 8 - (len(data) % 8)
        data += pad_len * chr(pad_len)
        return data
    
    # Remove padding of the opentext (it assume there is padding)
    def removePadding(self, data):
        pad_len = ord(data[-1])
        return data[:-pad_len]
    
    # wrapper over algorithm main routine to perform ENCRYPTION
    def encrypt(self, key, text, padding = False):
        return self.run(key, text, ENCRYPT, padding)
    
    # wrapper over algorithm main routine to perform DECRYPTION
    def decrypt(self, key, text, padding = False):
        return self.run(key, text, DECRYPT, padding)
    
if __name__ == '__main__':
    # default key: if longer than 8 bytes - will be truncated (9th and higher bytes will be discarded)
    key = "very_top_secret_key"
    # default opentext: should have 8-bytes-multiply length or use padding=True option in encrypt and decrypt methods
    defaulttext = "Hello world! It's a secret conidential message  "
    # init DES class
    d = des()
    # perform ENCRYPTION
    ciphertext = d.encrypt(key, defaulttext)
    # perform DECRYPTION
    checktext = d.decrypt(key, ciphertext)
    # output results
    print("Ciphered: %r" % ciphertext)
    print(":".join("{:02x}".format(ord(symb)) for symb in ciphertext))
    print("Deciphered:", checktext)
    print(":".join("{:02x}".format(ord(symb)) for symb in checktext))