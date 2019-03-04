from flask import Flask, render_template, request
from pg import db, User
from forms import AddUserForm

app = Flask(__name__)

app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql://localhost/flask'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = 'False'
db.init_app(app)

# Protect against CSRF (Cross Site Request Forgery) attacks
app.secret_key = "c1c673e3-5503-4885-8471-5ce78a5a32e8"

@app.route("/")
def index():
   return render_template("index.html")

@app.route("/more")
def more():
   return render_template("more.html")

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
         return "Success!"
   elif request.method == 'GET':
      return render_template("adduser.html", form=form)

if __name__ == "__main__":
   app.run(debug=True)

