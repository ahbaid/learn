import sys
import pickle


def main():

    f = open('pickle1.db','rb')

    a2=pickle.load(f)
    l2=pickle.load(f)

    f.close()

    print("a2 = ", a2)
    print("l2 = ", l2)

if __name__ == '__main__':
    main()
