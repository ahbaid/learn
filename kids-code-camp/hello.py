name = input("What is your name? ")
print ("Hello %s! Welcome!" % name)
offset = ''
for letter in name:
   offset += ' '
   print(offset+letter)
