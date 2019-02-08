~~~~
bash-3.2$ ./pargs.py
usage: pargs.py [-h] [-v] [-s {1,2,3}] x y
pargs.py: error: too few arguments
~~~~

~~~~
bash-3.2$ ./pargs.py -h
usage: pargs.py [-h] [-v] [-s {1,2,3}] x y

positional arguments:
  x                     enter a value for x
  y                     enter a value for y

optional arguments:
  -h, --help            show this help message and exit
  -v, --verbose         be verbose
  -s {1,2,3}, --smiles {1,2,3}
                        how many smiley faces to show
~~~~

~~~~
bash-3.2$ ./pargs.py 1 2
x=1
y=2
1+2=3
~~~~

~~~~
bash-3.2$ ./pargs.py 1 2 -v
The value of x is 1
The value of y is 2
The sum of 1 + 2 is 3
~~~~

~~~~
bash-3.2$ ./pargs.py 1 2 --verbose
The value of x is 1
The value of y is 2
The sum of 1 + 2 is 3
~~~~

~~~~
bash-3.2$ ./pargs.py 1 2 --verbose -smiles=5
usage: pargs.py [-h] [-v] [-s {1,2,3}] x y
pargs.py: error: argument -s/--smiles: invalid choice: 5 (choose from 1, 2, 3)
~~~~

~~~~
bash-3.2$ ./pargs.py 1 2 --verbose --smiles=3
The value of x is 1
The value of y is 2
The sum of 1 + 2 is 3
:)
:)
:)
~~~~
