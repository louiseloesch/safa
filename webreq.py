import urllib.request
import sys

uri = str(sys.argv[1])

urllib.request.urlopen(uri).read()
