from flask import Flask, render_template, request, session, redirect, url_for
from pg import db, User
from forms import AddUserForm, LoginForm

app = Flask(__name__)

app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql://localhost/flask'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = 'False'
db.init_app(app)

# Protect against CSRF (Cross Site Request Forgery) attacks
app.secret_key = "c1c673e3-5503-4885-8471-5ce78a5a32e8"

# {{{ "/"
@app.route("/")
def index():
   return render_template("index.html")
# }}}

# {{{ "/more"
@app.route("/more")
def more():
   return render_template("more.html")
# }}}

# {{{ "/home"
@app.route("/home")
def home():
   return render_template("home.html")
# }}}

# {{{ "/adduser"
@app.route("/adduser", methods=['GET','POST'])
def adduser():
   form = AddUserForm()
   if request.method == 'POST':
      if form.validate() == False:
         return render_template("adduser.html", form=form)
      else:
         newuser = User(form.username.data, form.password.data)
         db.session.add(newuser)
         db.session.commit()

         session['username'] = newuser.username
         return redirect(url_for('home'))
         #return "Success!"

   elif request.method == 'GET':
      return render_template("adduser.html", form=form)
# }}}

# {{{ "/login"
@app.route("/login", methods=['GET','POST'])
def login():
   form = LoginForm()
   if request.method == 'POST':
      if form.validate() == False:
         return render_template("login.html", form=form)
      else:
         username = form.username.data
         password = form.password.data

         user = User.query.filter_by(username=username).first()
         if user is not None and user.check_password(password):
            session['username'] = form.username.data
            return redirect(url_for('home'))
         else:
            return redirect(url_for('login'))

   elif request.method == 'GET':
      return render_template("login.html", form=form)
# }}}

if __name__ == "__main__":
   app.run(debug=True)

