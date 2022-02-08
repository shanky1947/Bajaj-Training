import bs4
from bs4 import BeautifulSoup as Soup
from urllib.request import urlopen

google_url="https://www.google.com/news/rss"
Client=urlopen(google_url)
xml_page=Client.read()
Client.close()

soup_page=Soup(xml_page,"xml")
google_url=soup_page.findAll("item")

for google in google_url:
  print(google.title.text)
  print(google.link.text)
  print(google.pubDate.text)
  print("-"*10)