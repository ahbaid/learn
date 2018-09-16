import sys
import shelve

def store():

    books = shelve.open('booklist')
    books['classic'] = 'Moby Dick'
    books['comic'] = 'Batman'
    books.close()


def retrieve():
    books2=shelve.open('booklist')
    for x in books2.items():
       print(x)
    books2.close()

def main():
    store()
    retrieve()

if __name__ == '__main__':
   main()
