#!/usr/bin/env python3
#-*- coding: utf-8 -*-
#===========================================================
# Source: https://jhafranco.com/2012/02/10/simplified-des-implementation-in-python/
# Author: Joao H de A Franco (jhafranco@acm.org)
# Description: Simplified DES implementation in Python 3
# Date: 2012-02-10
# License: Attribution-NonCommercial-ShareAlike 3.0 Unported
#          (CC BY-NC-SA 3.0)
#===========================================================
from sys import exit
from time import time
 
DEBUG = False

KeyLength = 10
SubKeyLength = 8
DataLength = 8
FLength = 4
 
# Tables for initial and final permutations (b1, b2, b3, ... b8)
IPtable = (2, 6, 3, 1, 4, 8, 5, 7)
FPtable = (4, 1, 3, 5, 7, 2, 8, 6)
 
# Tables for subkey generation (k1, k2, k3, ... k10)
P10table = (3, 5, 2, 7, 4, 10, 1, 9, 8, 6)
P8table = (6, 3, 7, 4, 8, 5, 10, 9)
 
# Tables for the fk function
EPtable = (4, 1, 2, 3, 2, 3, 4, 1)
S0table = (1, 0, 3, 2, 3, 2, 1, 0, 0, 2, 1, 3, 3, 1, 3, 2)
S1table = (0, 1, 2, 3, 2, 0, 1, 3, 3, 0, 1, 0, 2, 1, 0, 3)
P4table = (2, 4, 3, 1)
 
def perm(inputByte, permTable):
    """Permute input byte according to permutation table"""
    outputByte = 0
    for index, elem in enumerate(permTable):
        if index >= elem:
            outputByte |= (inputByte & (128 >> (elem - 1))) >> (index - (elem - 1))
        else:
            outputByte |= (inputByte & (128 >> (elem - 1))) << ((elem - 1) - index)
    return outputByte
 
def ip(inputByte):
    """Perform the initial permutation on data"""
    return perm(inputByte, IPtable)
 
def fp(inputByte):
    """Perform the final permutation on data"""
    return perm(inputByte, FPtable)
 
def swapNibbles(inputByte):
    """Swap the two nibbles of data"""
    return (inputByte << 4 | inputByte >> 4) & 0xff
 
def keyGen(key):
    """Generate the two required subkeys"""
    def leftShift(keyBitList):
        """Perform a circular left shift on the first and second five bits"""
        shiftedKey = [None] * KeyLength
        shiftedKey[0:9] = keyBitList[1:10]
        shiftedKey[4] = keyBitList[0]
        shiftedKey[9] = keyBitList[5]
        return shiftedKey
 
    # Converts input key (integer) into a list of binary digits
    keyList = [(key & 1 << i) >> i for i in reversed(range(KeyLength))]
    permKeyList = [None] * KeyLength
    for index, elem in enumerate(P10table):
        permKeyList[index] = keyList[elem - 1]
    shiftedOnceKey = leftShift(permKeyList)
    shiftedTwiceKey = leftShift(leftShift(shiftedOnceKey))
    subKey1 = subKey2 = 0
    for index, elem in enumerate(P8table):
        subKey1 += (128 >> index) * shiftedOnceKey[elem - 1]
        subKey2 += (128 >> index) * shiftedTwiceKey[elem - 1]
    return (subKey1, subKey2)
 
def fk(subKey, inputData):
    """Apply Feistel function on data with given subkey"""
    def F(sKey, rightNibble):
        aux = sKey ^ perm(swapNibbles(rightNibble), EPtable)
        index1 = ((aux & 0x80) >> 4) + ((aux & 0x40) >> 5) + \
                 ((aux & 0x20) >> 5) + ((aux & 0x10) >> 2)
        index2 = ((aux & 0x08) >> 0) + ((aux & 0x04) >> 1) + \
                 ((aux & 0x02) >> 1) + ((aux & 0x01) << 2)
        sboxOutputs = swapNibbles((S0table[index1] << 2) + S1table[index2])
        return perm(sboxOutputs, P4table)
 
    leftNibble, rightNibble = inputData & 0xf0, inputData & 0x0f
    return (leftNibble ^ F(subKey, rightNibble)) | rightNibble
 
def encrypt(key, plaintext):
    """Encrypt plaintext with given key"""
    data = fk(keyGen(key)[0], ip(plaintext))
    if DEBUG:
        print(f">>DEBUG - Inputs: Key = {key:>010b} ({key:>03X}) PT = {plaintext:>08b} ({plaintext:>02X})")
        print(f">>DEBUG - Round1: IP(PT) = {ip(plaintext):>08b} ({ip(plaintext):>02X}) RK = {keyGen(key)[0]:>08b} ({keyGen(key)[0]:>02X}) StateOut = {data:>08b} ({data:>02X}) ")
    result = fp(fk(keyGen(key)[1], swapNibbles(data)))
    if DEBUG:
        print(f">>DEBUG - Round2: RK = {keyGen(key)[1]:>08b} ({keyGen(key)[1]:>02X}) StateIn = {swapNibbles(data):>08b} ({swapNibbles(data):>02X})")
        print(f">>DEBUG - Outputs: StateOut = {fk(keyGen(key)[1], swapNibbles(data)):>08b} ({fk(keyGen(key)[1], swapNibbles(data)):>02X}) IPinv(StateOut) = {result:>08b} ({result:>02X})")
    return result
 
def decrypt(key, ciphertext):
    """Decrypt ciphertext with given key"""
    data = fk(keyGen(key)[1], ip(ciphertext))
    if DEBUG:
        print(f">>DEBUG - Inputs: Key = {key:>010b} ({key:>03X}) PT = {ciphertext:>08b} ({ciphertext:>02X})")
        print(f">>DEBUG - Round1: IP(PT) = {ip(ciphertext):>08b} ({ip(ciphertext):>02X}) RK = {keyGen(key)[1]:>08b} ({keyGen(key)[1]:>02X}) StateOut = {data:>08b} ({data:>02X}) ")
    result = fp(fk(keyGen(key)[0], swapNibbles(data)))
    if DEBUG:
        print(f">>DEBUG - Round2: RK = {keyGen(key)[0]:>08b} ({keyGen(key)[0]:>02X}) StateIn = {swapNibbles(data):>08b} ({swapNibbles(data):>02X})")
        print(f">>DEBUG - Outputs: StateOut = {fk(keyGen(key)[0], swapNibbles(data)):>08b} ({fk(keyGen(key)[0], swapNibbles(data)):>02X}) IPinv(StateOut) = {result:>08b} ({result:>02X})")
    return result
 
if __name__ == '__main__':
    # Test vectors described in "Simplified DES (SDES)"
    # (http://www2.kinneret.ac.il/mjmay/ise328/328-Assignment1-SDES.pdf)
 
    DEBUG = False

    # TEST CASE 1
    try:
        ckey = 0b1110001110
        data = 0b10101010
        cexp = 0b11001010
        cres = encrypt(ckey, data)
        assert cres == cexp
        print(f"Test 1 encryption: Key = {ckey:>010b} ({ckey:>03x}) Data = {data:>08b} ({data:>02x}) CTxt = {cres:>08b} ({cres:>02x})")
    except AssertionError:
        print("!! Test 1 - Error on encrypt:")
        print(f"Output: {cres:>08b}, Expected: {cexp:>08b}")
        exit(1)
    try:
        ckey = 0b1110001110
        ctxt = 0b11001010
        dexp = 0b10101010
        data = decrypt(ckey, ctxt)
        assert data == dexp
        print(f"Test 1 decryption: Key = {ckey:>010b} ({ckey:>03x}) CTxt = {ctxt:>08b} ({ctxt:>02x}) Data = {data:>08b} ({data:>02x})")
    except AssertionError:
        print("!! Test 1 - Error on decrypt:")
        print(f"Output: {data:>08b}, Expected: {dexp:>08b}")
        exit(1)
    
    # TEST CASE 2
    try:
        ckey = 0b1110001110
        data = 0b01010101
        cexp = 0b01110000
        cres = encrypt(ckey, data)
        assert cres == cexp
        print(f"Test 2 encryption: Key = {ckey:>010b} ({ckey:>03x}) Data = {data:>08b} ({data:>02x}) CTxt = {cres:>08b} ({cres:>02x})")
    except AssertionError:
        print("!! Test 2 - Error on encrypt:")
        print(f"Output: {cres:>08b}, Expected: {cexp:>08b}")
        exit(1)
    try:
        ckey = 0b1110001110
        ctxt = 0b01110000
        dexp = 0b01010101
        data = decrypt(ckey, ctxt)
        assert data == dexp
        print(f"Test 2 decryption: Key = {ckey:>010b} ({ckey:>03x}) CTxt = {ctxt:>08b} ({ctxt:>02x}) Data = {data:>08b} ({data:>02x})")
    except AssertionError:
        print("!! Test 2 - Error on decrypt:")
        print(f"Output: {data:>08b}, Expected: {dexp:>08b}")
        exit(1)
    
    # TEST CASE 3
    try:
        ckey = 0b1111111111
        data = 0b10101010
        cexp = 0b00000100
        cres = encrypt(ckey, data)
        assert cres == cexp
        print(f"Test 3 encryption: Key = {ckey:>010b} ({ckey:>03x}) Data = {data:>08b} ({data:>02x}) CTxt = {cres:>08b} ({cres:>02x})")
    except AssertionError:
        print("!! Test 3 - Error on encrypt:")
        print(f"Output: {cres:>08b}, Expected: {cexp:>08b}")
        exit(1)
    try:
        ckey = 0b1111111111
        ctxt = 0b00000100
        dexp = 0b10101010
        data = decrypt(ckey, ctxt)
        assert data == dexp
        print(f"Test 3 decryption: Key = {ckey:>010b} ({ckey:>03x}) CTxt = {ctxt:>08b} ({ctxt:>02x}) Data = {data:>08b} ({data:>02x})")
    except AssertionError:
        print("!! Test 3 - Error on decrypt:")
        print(f"Output: {data:>08b}, Expected: {dexp:>08b}")
        exit(1)

    # DEBUG = False

    # t1 = time()
    # for i in range(1000):
    #     encrypt(0b1110001110, 0b10101010)
    # t2 = time()
    # print("Elapsed time for 1,000 encryptions: {:0.3f}s".format(t2 - t1))
    # exit()