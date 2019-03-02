FLASK 

# Pre-requisites:

## Install flask package for python use
~~~~
pip install flask --user
~~~~

## Install virtualenv 
~~~~
$ pip install virtualenv --user
~~~~

* Create dev1 env 
~~~~
$ virtualenv dev1
New python executable in /Users/ahbaidg/work/dev1/bin/python
Installing setuptools, pip, wheel...
done.
~~~~

* Setup dev1 env 
~~~~
$ source dev1/bin/activate
(dev1) $ 
(dev1) $ cd dev1/
(dev1) $ pwd
/Users/ahbaidg/work/dev1
~~~~

* Install flask in dev1 env
~~~~
(dev1) $ pip install flask
~~~~

## Setup heroku in dev1
~~~~
(dev1) $ pip install heroku
(dev1) $ pip install heroku_tools
~~~~
