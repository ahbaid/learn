HEROKU

# Install Heroku's CLI
* https://devcenter.heroku.com/articles/heroku-cli
* OSX:
~~~~
$ brew tap heroku/brew && brew install heroku
~~~~

# Install virtualenv 
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


# Login to heroku
~~~~
$ heroku --version
heroku/7.22.2 darwin-x64 node-v11.9.0

$ heroku login -i
heroku: Enter your login credentials
Email [ahbaid@gmail.com]: 
Password: ************
Logged in as ahbaid@gmail.com
~~~~

# Clone the sample heroku app
~~~~
(dev1) $ git clone https://github.com/heroku/python-getting-started.git
Cloning into 'python-getting-started'...
remote: Enumerating objects: 446, done.
remote: Total 446 (delta 0), reused 0 (delta 0), pack-reused 446
Receiving objects: 100% (446/446), 74.67 KiB | 1.62 MiB/s, done.
Resolving deltas: 100% (224/224), done.

(dev1) $ cd python-getting-started/
(dev1) $ ls -al
total 72
drwxr-xr-x  15 ahbaidg  staff   480 Mar  2 15:12 .
drwxr-xr-x   7 ahbaidg  staff   224 Mar  2 15:12 ..
-rw-r--r--   1 ahbaidg  staff     8 Mar  2 15:12 .env
drwxr-xr-x  12 ahbaidg  staff   384 Mar  2 15:12 .git
drwxr-xr-x   3 ahbaidg  staff    96 Mar  2 15:12 .github
-rw-r--r--   1 ahbaidg  staff    56 Mar  2 15:12 .gitignore
-rw-r--r--   1 ahbaidg  staff    47 Mar  2 15:12 Procfile
-rw-r--r--   1 ahbaidg  staff    45 Mar  2 15:12 Procfile.windows
-rw-r--r--   1 ahbaidg  staff  1310 Mar  2 15:12 README.md
-rw-r--r--   1 ahbaidg  staff   609 Mar  2 15:12 app.json
drwxr-xr-x   7 ahbaidg  staff   224 Mar  2 15:12 gettingstarted
drwxr-xr-x  10 ahbaidg  staff   320 Mar  2 15:12 hello
-rwxr-xr-x   1 ahbaidg  staff   257 Mar  2 15:12 manage.py
-rw-r--r--   1 ahbaidg  staff    29 Mar  2 15:12 requirements.txt
-rw-r--r--   1 ahbaidg  staff    12 Mar  2 15:12 runtime.txt
~~~~



