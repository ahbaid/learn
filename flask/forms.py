from flask_wtf import FlaskForm
from wtforms import StringField, PasswordField, SubmitField, validators
from wtforms.validators import DataRequired, Length

# {{{ FlaskWTFDeprecationWarning: "flask_wtf.Form" has been renamed to "FlaskForm" and will be removed in 1.0.
#
# from flask_wtf import Form
# changes to
# from flask_wtf import FlaskForm
#
# class AddUserForm(Form):
# changes to
# class AddUserForm(FlaskForm):
# }}}

class AddUserForm(FlaskForm):
   username = StringField('Username', [DataRequired(message="Please enter a username.")])
   password = PasswordField('Password', [DataRequired("Please enter a password."), Length(min=8, message="Must be 8 characters!")])
   submit = SubmitField('Add User')

class LoginForm(FlaskForm):
   username = StringField('Username', [DataRequired(message="Please enter yout username.")])
   password = PasswordField('Password', [DataRequired("Please enter your password."), Length(min=8, message="Must be 8 characters!")])
   submit = SubmitField('Login')
