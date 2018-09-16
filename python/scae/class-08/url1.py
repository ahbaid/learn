# http://docs.python.org/library/urllib.html

import urllib.parse

amazon_url = 'http://www.amazon.com/s?ie=UTF8&tag=mozilla-20&index=blended&link_code=qs&field-keywords=kindle%20dx&sourceid=Mozilla-search'

u1 = urllib.parse.urlparse(amazon_url)
type(u1)
print("u1 :",u1)

u2 = urllib.parse.urlsplit(amazon_url)
type(u2)
print("u2 :",u2)
