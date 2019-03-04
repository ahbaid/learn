from flask import Flask, render_template
from models import db

app = Flask(__name__)

app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql://localhost/flask'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = 'False'
db.init_app(app)

@app.route("/")
def index():
   return render_template("index.html")

@app.route("/more")
def more():
   return render_template("more.html")

if __name__ == "__main__":
   app.run(debug=True)

