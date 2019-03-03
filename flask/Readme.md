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

* Create flask env 
~~~~
$ virtualenv flask
New python executable in /Users/ahbaidg/work/flask/bin/python
Installing setuptools, pip, wheel...
done.
~~~~

* Setup flask env 
~~~~
$ source flask/bin/activate
(flask) $ 
(flask) $ cd flask/
(flask) $ pwd
/Users/ahbaidg/work/flask
~~~~

* Install flask in flask env
~~~~
(flask) $ pip install flask
~~~~

## Setup heroku in flask
~~~~
$ heroku --version
heroku/7.22.2 darwin-x64 node-v11.9.0

$ heroku login -i
heroku: Enter your login credentials
Email [ahbaid@gmail.com]: 
Password: ************
Logged in as ahbaid@gmail.com
~~~~

## Setup flask app 
~~~~
(flask) $ pwd
/Users/ahbaidg/work/flask
(flask) $ mkdir -p static/css static/js static/image templates
(flask) $ touch routes.py Readme.md
~~~~

