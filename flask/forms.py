from flask_wtf import FlaskForm
from wtforms import StringField, PasswordField, SubmitField

# FlaskWTFDeprecationWarning: "flask_wtf.Form" has been renamed to "FlaskForm" and will be removed in 1.0.

class AddUserForm(FlaskForm):
   username = StringField('Username')
   password = PasswordField('Password')
   submit = SubmitField('Add User')
