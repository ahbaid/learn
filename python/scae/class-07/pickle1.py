import sys
import pickle


def main():
    a = {}
    a['one'] = 1
    a['two'] = 22

    l = ['a','bb', 'ccc']

    print ('a = ',a)
    print ("l = ",l)

    f = open('pickle1.db','wb')
    pickle.dump(a,f)
    pickle.dump(l,f)

    f.close()


if __name__ == '__main__':
    main()
