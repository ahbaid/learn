from cryptokit import *

#seed=raw_input("Enter an encryption key seed: ")
ekey='abcd'*16

text=raw_input("Enter a string to encrypt: ")
etext=encrypt(text,ekey)
print etext

raw_input("Press Enter to decrypt....")
print decrypt(etext,ekey)
