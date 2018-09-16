# http://docs.python.org/library/htmlparser.html

from html.parser import HTMLParser

class MyHTMLParser(HTMLParser):

   def __init__(self):
       HTMLParser.__init__(self)
       self.in_a_tag = False

   def handle_starttag(self, tag, attrs):
       at = dict(attrs)
       if tag=="a" and "href" in at:
          self.in_a_tag = True
          print(at['href'])

   def handle_endtag(self, tag):
       if tag=='a':
          self.in_a_tag==False
          pass



def main():

   page ="""
<html>
<head>
   <title>test</title>
</head>
<body>
   <a href='www.amazon.com'>www.amazon.com link</a>
   <a href='www.google.com'>www.google.com link</a>
</body>
</html>
"""
   

   myparser = MyHTMLParser()
   myparser.feed(page)


if __name__ == '__main__':
   main()
