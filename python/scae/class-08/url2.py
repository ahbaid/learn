import urllib.request

amazon_url = 'http://www.amazon.com/s?ie=UTF8&tag=mozilla-20&index=blended&link_code=qs&field-keywords=kindle%20dx&sourceid=Mozilla-search'
p_url = "http://www.python.org"

f = urllib.request.urlopen(p_url)

x=f.read(100)
print(x)
