import urllib.request

def webReq (uri):

    urllib.request.urlopen(uri).read()
