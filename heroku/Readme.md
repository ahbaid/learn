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

* Create hkdev env 
~~~~
$ virtualenv hkdev
New python executable in /Users/ahbaidg/work/hkdev/bin/python
Installing setuptools, pip, wheel...
done.
~~~~

* Setup hkdev env 
~~~~
$ source hkdev/bin/activate
(hkdev) $ 
(hkdev) $ cd hkdev/
(hkdev) $ pwd
/Users/ahbaidg/work/hkdev
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
(hkdev) $ git clone https://github.com/heroku/python-getting-started.git
Cloning into 'python-getting-started'...
remote: Enumerating objects: 446, done.
remote: Total 446 (delta 0), reused 0 (delta 0), pack-reused 446
Receiving objects: 100% (446/446), 74.67 KiB | 1.62 MiB/s, done.
Resolving deltas: 100% (224/224), done.

(hkdev) $ cd python-getting-started/
(hkdev) $ ls -al
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

# Deploy the App

## Create
~~~~
(hkdev) $ heroku create
Creating app... done, ⬢ polar-chamber-59936
https://polar-chamber-59936.herokuapp.com/ | https://git.heroku.com/polar-chamber-59936.git
~~~~

## Push
~~~~
$ git push heroku master
Enumerating objects: 446, done.
Counting objects: 100% (446/446), done.
Delta compression using up to 4 threads
Compressing objects: 100% (196/196), done.
Writing objects: 100% (446/446), 74.67 KiB | 24.89 MiB/s, done.
Total 446 (delta 224), reused 446 (delta 224)
remote: Compressing source files... done.
remote: Building source:
remote: 
remote: -----> Python app detected
remote:  !     Python has released a security update! Please consider upgrading to python-3.7.2
remote:        Learn More: https://devcenter.heroku.com/articles/python-runtimes
remote: -----> Installing python-3.7.0
remote: -----> Installing pip
remote: -----> Installing SQLite3
remote: -----> Installing requirements with pip
remote:        Collecting django (from -r /tmp/build_82e1c3a8c32931603b1c29ccd1d8af73/requirements.txt (line 1))
remote:          Downloading https://files.pythonhosted.org/packages/c7/87/fbd666c4f87591ae25b7bb374298e8629816e87193c4099d3608ef11fab9/Django-2.1.7-py3-none-any.whl (7.3MB)
remote:        Collecting gunicorn (from -r /tmp/build_82e1c3a8c32931603b1c29ccd1d8af73/requirements.txt (line 2))
remote:          Downloading https://files.pythonhosted.org/packages/8c/da/b8dd8deb741bff556db53902d4706774c8e1e67265f69528c14c003644e6/gunicorn-19.9.0-py2.py3-none-any.whl (112kB)
remote:        Collecting django-heroku (from -r /tmp/build_82e1c3a8c32931603b1c29ccd1d8af73/requirements.txt (line 3))
remote:          Downloading https://files.pythonhosted.org/packages/59/af/5475a876c5addd5a3494db47d9f7be93cc14d3a7603542b194572791b6c6/django_heroku-0.3.1-py2.py3-none-any.whl
remote:        Collecting pytz (from django->-r /tmp/build_82e1c3a8c32931603b1c29ccd1d8af73/requirements.txt (line 1))
remote:          Downloading https://files.pythonhosted.org/packages/61/28/1d3920e4d1d50b19bc5d24398a7cd85cc7b9a75a490570d5a30c57622d34/pytz-2018.9-py2.py3-none-any.whl (510kB)
remote:        Collecting whitenoise (from django-heroku->-r /tmp/build_82e1c3a8c32931603b1c29ccd1d8af73/requirements.txt (line 3))
remote:          Downloading https://files.pythonhosted.org/packages/fd/2a/b51377ab9826f0551da19951257d2434f46329cd6cfdf9592ea9ca5f6034/whitenoise-4.1.2-py2.py3-none-any.whl
remote:        Collecting psycopg2 (from django-heroku->-r /tmp/build_82e1c3a8c32931603b1c29ccd1d8af73/requirements.txt (line 3))
remote:          Downloading https://files.pythonhosted.org/packages/0c/ba/e521b9dfae78dc88d3e88be99c8d6f8737a69b65114c5e4979ca1209c99f/psycopg2-2.7.7-cp37-cp37m-manylinux1_x86_64.whl (2.7MB)
remote:        Collecting dj-database-url>=0.5.0 (from django-heroku->-r /tmp/build_82e1c3a8c32931603b1c29ccd1d8af73/requirements.txt (line 3))
remote:          Downloading https://files.pythonhosted.org/packages/d4/a6/4b8578c1848690d0c307c7c0596af2077536c9ef2a04d42b00fabaa7e49d/dj_database_url-0.5.0-py2.py3-none-any.whl
remote:        Installing collected packages: pytz, django, gunicorn, whitenoise, psycopg2, dj-database-url, django-heroku
remote:        Successfully installed dj-database-url-0.5.0 django-2.1.7 django-heroku-0.3.1 gunicorn-19.9.0 psycopg2-2.7.7 pytz-2018.9 whitenoise-4.1.2
remote: 
remote: -----> $ python manage.py collectstatic --noinput
remote:        120 static files copied to '/tmp/build_82e1c3a8c32931603b1c29ccd1d8af73/staticfiles', 376 post-processed.
remote: 
remote: -----> Discovering process types
remote:        Procfile declares types -> web
remote: 
remote: -----> Compressing...
remote:        Done: 57.1M
remote: -----> Launching...
remote:        Released v5
remote:        https://polar-chamber-59936.herokuapp.com/ deployed to Heroku
remote: 
remote: Verifying deploy... done.
To https://git.heroku.com/polar-chamber-59936.git
 * [new branch]      master -> master
~~~~

## Ensure one instance is running
~~~~
(hkdev) $ heroku ps:scale web1
web=1:Free
~~~~

## Visit the app
~~~~
(hkdev) $ heroku open
~~~~


