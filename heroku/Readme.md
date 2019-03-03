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
* https://polar-chamber-59936.herokuapp.com/
~~~~
(hkdev) $ heroku open
~~~~

## Check Process
~~~~
(hkdev) $ heroku ps
Free dyno hours quota remaining this month: 550h 0m (100%)
Free dyno usage for this app: 0h 0m (0%)
For more information on dyno sleeping and how to upgrade, see:
https://devcenter.heroku.com/articles/dyno-sleeping

=== web (Free): gunicorn gettingstarted.wsgi --log-file - (1)
web.1: up 2019/03/02 17:45:04 -0800 (~ 4m ago)
~~~~

## Scale Web Tier Dynos
~~~~
(hkdev) $ heroku ps
Free dyno hours quota remaining this month: 550h 0m (100%)
Free dyno usage for this app: 0h 0m (0%)
For more information on dyno sleeping and how to upgrade, see:
https://devcenter.heroku.com/articles/dyno-sleeping

=== web (Free): gunicorn gettingstarted.wsgi --log-file - (1)
web.1: up 2019/03/02 17:45:04 -0800 (~ 4m ago)

(hkdev) $ heroku ps:scale web=2
Scaling dynos... !
 ▸    Cannot update to more than 1 Free size dynos per process type.
(hkdev) $ heroku ps:scale web=0
Scaling dynos... done, now running web at 0:Free
~~~~

## Tail logs
~~~~
(hkdev) $ heroku logs --tail
2019-03-02T23:19:48.815670+00:00 app[api]: Release v1 created by user ahbaid@gmail.com
2019-03-02T23:19:48.815670+00:00 app[api]: Initial release by user ahbaid@gmail.com
2019-03-02T23:19:49.202793+00:00 app[api]: Enable Logplex by user ahbaid@gmail.com
2019-03-02T23:19:49.202793+00:00 app[api]: Release v2 created by user ahbaid@gmail.com
2019-03-02T23:20:52.000000+00:00 app[api]: Build started by user ahbaid@gmail.com
2019-03-02T23:21:29.797512+00:00 heroku[web.1]: Starting process with command `gunicorn gettingstarted.wsgi --log-file -`
2019-03-02T23:21:31.593620+00:00 app[web.1]: [2019-03-02 23:21:31 +0000] [4] [INFO] Starting gunicorn 19.9.0
2019-03-02T23:21:31.594202+00:00 app[web.1]: [2019-03-02 23:21:31 +0000] [4] [INFO] Listening at: http://0.0.0.0:28143 (4)
2019-03-02T23:21:31.594356+00:00 app[web.1]: [2019-03-02 23:21:31 +0000] [4] [INFO] Using worker: sync
2019-03-02T23:21:31.598254+00:00 app[web.1]: [2019-03-02 23:21:31 +0000] [10] [INFO] Booting worker with pid: 10
2019-03-02T23:21:31.633252+00:00 app[web.1]: [2019-03-02 23:21:31 +0000] [11] [INFO] Booting worker with pid: 11
2019-03-02T23:21:31.876878+00:00 app[web.1]: /app/.heroku/python/lib/python3.7/site-packages/psycopg2/__init__.py:144: UserWarning: The psycopg2 wheel package will be renamed from release 2.8; in order to keep installing from binary please use "pip install psycopg2-binary" instead. For details see: <http://initd.org/psycopg/docs/install.html#binary-install-from-pypi>.
2019-03-02T23:21:31.876917+00:00 app[web.1]: """)
2019-03-02T23:21:31.910699+00:00 app[web.1]: /app/.heroku/python/lib/python3.7/site-packages/psycopg2/__init__.py:144: UserWarning: The psycopg2 wheel package will be renamed from release 2.8; in order to keep installing from binary please use "pip install psycopg2-binary" instead. For details see: <http://initd.org/psycopg/docs/install.html#binary-install-from-pypi>.
2019-03-02T23:21:31.910703+00:00 app[web.1]: """)
2019-03-02T23:21:32.211725+00:00 heroku[web.1]: State changed from starting to up
2019-03-02T23:21:24.779810+00:00 app[api]: Attach DATABASE (@ref:postgresql-defined-96677) by user ahbaid@gmail.com
2019-03-02T23:21:24.779810+00:00 app[api]: Running release v3 commands by user ahbaid@gmail.com
2019-03-02T23:21:25.076281+00:00 app[api]: Release v5 created by user ahbaid@gmail.com
2019-03-02T23:21:25.076281+00:00 app[api]: Deploy e6442b7c by user ahbaid@gmail.com
2019-03-02T23:21:25.091897+00:00 app[api]: Scaled to web@1:Free by user ahbaid@gmail.com
2019-03-02T23:21:24.795504+00:00 app[api]: Release v4 created by user ahbaid@gmail.com
2019-03-02T23:21:24.795504+00:00 app[api]: @ref:postgresql-defined-96677 completed provisioning, setting DATABASE_URL. by user ahbaid@gmail.com
2019-03-02T23:21:34.000000+00:00 app[api]: Build succeeded
2019-03-02T23:25:55.461028+00:00 heroku[router]: at=info method=GET path="/static/lang-logo.png" host=polar-chamber-59936.herokuapp.com request_id=ad4837d7-17fd-4fd5-8b51-534813786491 fwd="73.15.189.167" dyno=web.1 connect=1ms service=5ms status=200 bytes=2498 protocol=https
2019-03-02T23:25:55.336108+00:00 app[web.1]: 10.152.39.6 - - [02/Mar/2019:23:25:55 +0000] "GET / HTTP/1.1" 200 7425 "-" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.119 Safari/537.36"
2019-03-02T23:25:55.459182+00:00 app[web.1]: 10.152.39.6 - - [02/Mar/2019:23:25:55 +0000] "GET /static/lang-logo.png HTTP/1.1" 200 0 "https://polar-chamber-59936.herokuapp.com/" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.119 Safari/537.36"
2019-03-02T23:25:55.341010+00:00 heroku[router]: at=info method=GET path="/" host=polar-chamber-59936.herokuapp.com request_id=4bc339b2-9905-4f5d-9029-c80dd3cd55ea fwd="73.15.189.167" dyno=web.1 connect=1ms service=40ms status=200 bytes=7616 protocol=https
2019-03-02T23:25:56.120206+00:00 heroku[router]: at=info method=GET path="/favicon.ico" host=polar-chamber-59936.herokuapp.com request_id=95d1d115-2eb1-44ed-ae11-45c349dab445 fwd="73.15.189.167" dyno=web.1 connect=1ms service=22ms status=404 bytes=2411 protocol=https
2019-03-02T23:25:56.119503+00:00 app[web.1]: Not Found: /favicon.ico
2019-03-02T23:25:56.120358+00:00 app[web.1]: 10.152.39.6 - - [02/Mar/2019:23:25:56 +0000] "GET /favicon.ico HTTP/1.1" 404 2228 "https://polar-chamber-59936.herokuapp.com/" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.119 Safari/537.36"
2019-03-03T00:00:35.751645+00:00 heroku[web.1]: Idling
2019-03-03T00:00:35.755700+00:00 heroku[web.1]: State changed from up to down
2019-03-03T00:00:37.257701+00:00 heroku[web.1]: Stopping all processes with SIGTERM
2019-03-03T00:00:37.287703+00:00 app[web.1]: [2019-03-03 00:00:37 +0000] [10] [INFO] Worker exiting (pid: 10)
2019-03-03T00:00:37.288399+00:00 app[web.1]: [2019-03-03 00:00:37 +0000] [11] [INFO] Worker exiting (pid: 11)
2019-03-03T00:00:37.357672+00:00 app[web.1]: [2019-03-03 00:00:37 +0000] [4] [INFO] Handling signal: term
2019-03-03T00:00:37.459557+00:00 app[web.1]: [2019-03-03 00:00:37 +0000] [4] [INFO] Shutting down: Master
2019-03-03T00:00:37.814987+00:00 heroku[web.1]: Process exited with status 0
2019-03-03T01:44:55.134996+00:00 heroku[web.1]: Unidling
2019-03-03T01:44:55.139108+00:00 heroku[web.1]: State changed from down to starting
2019-03-03T01:45:00.780147+00:00 heroku[web.1]: Starting process with command `gunicorn gettingstarted.wsgi --log-file -`
2019-03-03T01:45:03.008296+00:00 app[web.1]: [2019-03-03 01:45:03 +0000] [4] [INFO] Starting gunicorn 19.9.0
2019-03-03T01:45:03.009046+00:00 app[web.1]: [2019-03-03 01:45:03 +0000] [4] [INFO] Listening at: http://0.0.0.0:56237 (4)
2019-03-03T01:45:03.009171+00:00 app[web.1]: [2019-03-03 01:45:03 +0000] [4] [INFO] Using worker: sync
2019-03-03T01:45:03.013322+00:00 app[web.1]: [2019-03-03 01:45:03 +0000] [10] [INFO] Booting worker with pid: 10
2019-03-03T01:45:03.096255+00:00 app[web.1]: [2019-03-03 01:45:03 +0000] [11] [INFO] Booting worker with pid: 11
2019-03-03T01:45:03.371008+00:00 app[web.1]: /app/.heroku/python/lib/python3.7/site-packages/psycopg2/__init__.py:144: UserWarning: The psycopg2 wheel package will be renamed from release 2.8; in order to keep installing from binary please use "pip install psycopg2-binary" instead. For details see: <http://initd.org/psycopg/docs/install.html#binary-install-from-pypi>.
2019-03-03T01:45:03.371079+00:00 app[web.1]: """)
2019-03-03T01:45:03.486930+00:00 app[web.1]: /app/.heroku/python/lib/python3.7/site-packages/psycopg2/__init__.py:144: UserWarning: The psycopg2 wheel package will be renamed from release 2.8; in order to keep installing from binary please use "pip install psycopg2-binary" instead. For details see: <http://initd.org/psycopg/docs/install.html#binary-install-from-pypi>.
2019-03-03T01:45:03.486934+00:00 app[web.1]: """)
2019-03-03T01:45:04.656268+00:00 heroku[web.1]: State changed from starting to up
2019-03-03T01:45:05.243560+00:00 heroku[router]: at=info method=GET path="/" host=polar-chamber-59936.herokuapp.com request_id=89b01abf-62be-45a3-af33-d1b93f859b02 fwd="73.15.189.167" dyno=web.1 connect=0ms service=26ms status=200 bytes=7616 protocol=https
2019-03-03T01:45:05.243247+00:00 app[web.1]: 10.63.87.207 - - [03/Mar/2019:01:45:05 +0000] "GET / HTTP/1.1" 200 7425 "https://github.com/ahbaid/learn/tree/master/heroku" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.119 Safari/537.36"
2019-03-03T01:45:05.462826+00:00 app[web.1]: 10.63.87.207 - - [03/Mar/2019:01:45:05 +0000] "GET /static/lang-logo.png HTTP/1.1" 304 0 "https://polar-chamber-59936.herokuapp.com/" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.119 Safari/537.36"
2019-03-03T01:45:05.463246+00:00 heroku[router]: at=info method=GET path="/static/lang-logo.png" host=polar-chamber-59936.herokuapp.com request_id=e9aebefe-885d-4e06-9344-6dadfd886b98 fwd="73.15.189.167" dyno=web.1 connect=0ms service=4ms status=304 bytes=166 protocol=https
2019-03-03T01:46:06.032334+00:00 heroku[router]: at=info method=GET path="/" host=polar-chamber-59936.herokuapp.com request_id=1266ada6-cf9d-4e12-9ae9-f1137399c829 fwd="73.15.189.167" dyno=web.1 connect=1ms service=32ms status=200 bytes=7616 protocol=https
2019-03-03T01:46:06.031337+00:00 app[web.1]: 10.29.81.254 - - [03/Mar/2019:01:46:06 +0000] "GET / HTTP/1.1" 200 7425 "-" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.119 Safari/537.36"
2019-03-03T01:46:06.144222+00:00 app[web.1]: 10.29.81.254 - - [03/Mar/2019:01:46:06 +0000] "GET /static/lang-logo.png HTTP/1.1" 304 0 "https://polar-chamber-59936.herokuapp.com/" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.119 Safari/537.36"
2019-03-03T01:46:06.142363+00:00 heroku[router]: at=info method=GET path="/static/lang-logo.png" host=polar-chamber-59936.herokuapp.com request_id=a97f90bd-9d9d-4710-b6cf-b3e64de90e24 fwd="73.15.189.167" dyno=web.1 connect=1ms service=6ms status=304 bytes=166 protocol=https
~~~~


