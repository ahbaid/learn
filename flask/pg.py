from flask_sqlalchemy import SQLAlchemy
from werkzeug import generate_password_hash, check_password_hash

import geocoder
import urllib2
import json

db = SQLAlchemy()

# {{{ class User(db.Model):
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
# }}}

# {{{ class Place(object):
# p = Place()
# places = p.query("1600 Amphitheater Parkway Mountain View CA")
class Place(object):
   def meters_to_walking_time(self, meters):
      # 80 meters = 1 minute walking
      return int(meters / 80)

   def wiki_path(self, slug):
      return urllib2.urlparse.urljoin("http://en.wikipedia.org/wiki/", slug.replace(' ','_'))

   def address_to_latlng(self, address):
      g = geocoder.google(address)
      return (g.lat, g.lng)

   def query(self, address):
      lat, lng = self.address_to_latlng(address)

      query_url = 'https://en.wikipedia.org/w/api.php?action=query&list=geosearch&gsradius=5000&gscoord={0}%7C{1}&gslimit=20&format=json'.format(lat, lng)
      g = urllib2.urlopen(query_url)
      results = g.read()
      g.close()

      data = json.loads(results)

      places = []
      for place in data['query']['geosearch']:
         name = place['title']
         meters = place['dist']
         lat = place['lat']
         lng = place['lon']

         wiki_url = self.wiki_path(name)
         walking_time = self.meters_to_walking_time(meters)

         d = {
           'name': name,
           'url': wiki_url,
           'time': walking_time,
           'lat': lat,
           'lng': lng
         }

         places.append(d)

      return places


# }}}
