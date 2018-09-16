
abc = 'abcdefghijklmnopqrstuvwxyz'

dabc={}
for i in range(len(abc)):
   dabc[abc[i]] = i

def cmap(char):

    if char not in abc:
       return char

    indexpos=dabc[char]

    if indexpos==24:
       indexpos=0
    elif indexpos==25:
       indexpos=1
    else:
       indexpos=indexpos+2

    return abc[indexpos]
    

assert cmap('x')=='z'
assert cmap('y')=='a'
assert cmap('z')=='b'

txt="g fmnc wms bgblr rpylqjyrc gr zw fylb. rfyrq ufyr amknsrcpq ypc dmp. \
bmgle gr gl zw fylb gq glcddgagclr ylb rfyr'q ufw rfgq rcvr gq qm jmle. sqgle qrpgle.kyicrpylq() gq pcamkkclbcb. lmu ynnjw ml rfc spj."

url='http://www.pythonchallenge.com/pc/def/map.html'

str='map'

for c in str:
   print(cmap(c), end='')

print('\n')
