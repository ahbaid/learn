from flask import Flask, render_template, request, session, redirect, url_for
from pg import db, User, Place
from forms import AddUserForm, LoginForm, AddressForm

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
@app.route("/home", methods=['GET','POST'])
def home():
   if 'username' not in session:
      return redirect(url_for('login'))
   
   form = AddressForm()

   places = []
   coords = (37.4221, -122.0844)

   if request.method == 'POST':

      if form.validate() == False:
         return render_template("home.html",form=form)
      else:
         #pass
         # get the address
         address = form.address.data

         # query for places around it using 
         p = Place()
         coords = p.address_to_latlng(address)
         places = p.query(address)

         # return the results
         return render_template('home.html', form=form, coords=coords, places=places)

   elif request.method == 'GET': 
      return render_template("home.html", form=form, coords=coords, places=places)

# }}}

# {{{ "/adduser"
@app.route("/adduser", methods=['GET','POST'])
def adduser():

   if 'username' in session:
      return redirect(url_for('home'))

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

   if 'username' in session:
      return redirect(url_for('home'))

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

# {{{ "/logout"
@app.route("/logout", methods=['GET','POST'])
def logout():
   session.pop('username',None)
   return redirect(url_for('login'))
# }}}

if __name__ == "__main__":
   app.run(debug=True)

