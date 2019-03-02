FLASK 

# Pre-requisites:

## Install Heroku's CLI
* https://devcenter.heroku.com/articles/heroku-cli
* OSX:
~~~~
$ brew tap heroku/brew && brew install heroku
~~~~

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
(dev1) $ heroku login
heroku: Press any key to open up the browser to login or q to exit: 
Logging in... done
Logged in as ahbaid@gmail.com

$ heroku --version
heroku/7.22.2 darwin-x64 node-v11.9.0
~~~~
