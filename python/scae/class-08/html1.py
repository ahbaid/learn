# http://docs.python.org/library/htmlparser.html

from html.parser import HTMLParser

class MyHTMLParser(HTMLParser):

   def handle_starttag(self, tag, attrs):
       print("start tag: %s" % tag)

   def handle_endtag(self, tag):
       print("end tag: %s" % tag)



def main():

   page="<a color=black>poo</a>"
   page ="""
<html>
<head>
   <title>test</title>
</head>
<body>
</body>
</html>
"""
   

   myparser = MyHTMLParser()
   myparser.feed(page)


if __name__ == '__main__':
   main()
