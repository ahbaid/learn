from flask import Flask, render_template
from models import db
from forms import AddUserForm

app = Flask(__name__)

app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql://localhost/flask'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = 'False'
db.init_app(app)

# Protect against CSRF (Cross Site Request Forgery) attacks
app.secret_key = "development-key"

@app.route("/")
def index():
   return render_template("index.html")

@app.route("/more")
def more():
   return render_template("more.html")

@app.route("/adduser")
def adduser():
   form = AddUserForm()
   return render_template("adduser.html", form=form)

if __name__ == "__main__":
   app.run(debug=True)

