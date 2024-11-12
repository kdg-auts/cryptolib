#-*- coding utf-8 -*-
# python ver. 3.7
#def caesar_core()
alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyzАБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЬЫЪЭЮЯІЇЄҐабвгдеёжзийклмнопрстуфцхчшщьыъэюяіїєґ'
#symbols = '.\/[]{}()=-.,;:\'"1234567890~!`@#$%^&*<>?|=+_- '
key = int(input('Enter key: '))
opentext = input('Enter message: ').strip()
ciphertext = ''
for letter in opentext:
    if not letter in alphabet:
        ciphertext += letter
    else:
        ciphertext += alphabet[(alphabet.index(letter) + key) % len(alphabet)]
print('Result: ' + ciphertext)