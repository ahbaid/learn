from flask_wtf import FlaskForm
from wtforms import StringField, PasswordField, SubmitField, validators

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
   username = StringField('Username', [validators.DataRequired(message="Please enter a username.")])
   password = PasswordField('Password', [validators.DataRequired("Please enter a password.")])
   submit = SubmitField('Add User')
