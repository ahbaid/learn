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
Collecting flask
  Using cached https://files.pythonhosted.org/packages/7f/e7/08578774ed4536d3242b14dacb4696386634607af824ea997202cd0edb4b/Flask-1.0.2-py2.py3-none-any.whl
Collecting itsdangerous>=0.24 (from flask)
  Using cached https://files.pythonhosted.org/packages/76/ae/44b03b253d6fade317f32c24d100b3b35c2239807046a4c953c7b89fa49e/itsdangerous-1.1.0-py2.py3-none-any.whl
Collecting Jinja2>=2.10 (from flask)
  Using cached https://files.pythonhosted.org/packages/7f/ff/ae64bacdfc95f27a016a7bed8e8686763ba4d277a78ca76f32659220a731/Jinja2-2.10-py2.py3-none-any.whl
Collecting Werkzeug>=0.14 (from flask)
  Using cached https://files.pythonhosted.org/packages/20/c4/12e3e56473e52375aa29c4764e70d1b8f3efa6682bef8d0aae04fe335243/Werkzeug-0.14.1-py2.py3-none-any.whl
Collecting click>=5.1 (from flask)
  Using cached https://files.pythonhosted.org/packages/fa/37/45185cb5abbc30d7257104c434fe0b07e5a195a6847506c074527aa599ec/Click-7.0-py2.py3-none-any.whl
Collecting MarkupSafe>=0.23 (from Jinja2>=2.10->flask)
  Using cached https://files.pythonhosted.org/packages/6d/d2/0ccd2c0e2cd93b35e765d9b3205cd6602e6b202b522fc7997531353715b3/MarkupSafe-1.1.1-cp27-cp27m-macosx_10_6_intel.whl
Installing collected packages: itsdangerous, MarkupSafe, Jinja2, Werkzeug, click, flask
Successfully installed Jinja2-2.10 MarkupSafe-1.1.1 Werkzeug-0.14.1 click-7.0 flask-1.0.2 itsdangerous-1.1.0
~~~~

## Setup heroku
~~~~
(dev1) $ pip install heroku
Collecting heroku
Collecting python-dateutil==1.5 (from heroku)
Collecting requests>=1.0.0 (from heroku)
  Downloading https://files.pythonhosted.org/packages/7d/e3/20f3d364d6c8e5d2353c72a67778eb189176f08e873c9900e10c0287b84b/requests-2.21.0-py2.py3-none-any.whl (57kB)
    100% |████████████████████████████████| 61kB 852kB/s 
Collecting chardet<3.1.0,>=3.0.2 (from requests>=1.0.0->heroku)
  Using cached https://files.pythonhosted.org/packages/bc/a9/01ffebfb562e4274b6487b4bb1ddec7ca55ec7510b22e4c51f14098443b8/chardet-3.0.4-py2.py3-none-any.whl
Collecting idna<2.9,>=2.5 (from requests>=1.0.0->heroku)
  Downloading https://files.pythonhosted.org/packages/14/2c/cd551d81dbe15200be1cf41cd03869a46fe7226e7450af7a6545bfc474c9/idna-2.8-py2.py3-none-any.whl (58kB)
    100% |████████████████████████████████| 61kB 5.4MB/s 
Collecting certifi>=2017.4.17 (from requests>=1.0.0->heroku)
  Downloading https://files.pythonhosted.org/packages/9f/e0/accfc1b56b57e9750eba272e24c4dddeac86852c2bebd1236674d7887e8a/certifi-2018.11.29-py2.py3-none-any.whl (154kB)
    100% |████████████████████████████████| 163kB 2.6MB/s 
Collecting urllib3<1.25,>=1.21.1 (from requests>=1.0.0->heroku)
  Downloading https://files.pythonhosted.org/packages/62/00/ee1d7de624db8ba7090d1226aebefab96a2c71cd5cfa7629d6ad3f61b79e/urllib3-1.24.1-py2.py3-none-any.whl (118kB)
    100% |████████████████████████████████| 122kB 15.5MB/s 
Installing collected packages: python-dateutil, chardet, idna, certifi, urllib3, requests, heroku
Successfully installed certifi-2018.11.29 chardet-3.0.4 heroku-0.1.4 idna-2.8 python-dateutil-1.5 requests-2.21.0 urllib3-1.24.1
~~~~
