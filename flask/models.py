from flask_sqlalchemy import SQLAlchemy
from werkzeug import generate_password_hash, check_password_hash

db = SQLAlchemy()

class User(db.Model):
  __tablename__ = 'users'
  userid = db.Column(db.Integer, primary_key = True)
  username = db.Column(db.String(25), unique=True)
  userpwdhash = db.Column(db.String(200))

  def __init__(self, username, password):
    self.username = username.lower()
    self.set_password(password)
     
  def set_password(self, password):
    self.pwdhash = generate_password_hash(password)

  def check_password(self, password):
    return check_password_hash(self.pwdhash, password)
