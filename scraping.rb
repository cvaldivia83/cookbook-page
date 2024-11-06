require 'nokogiri'
require 'open-uri'

ingredient = 'chocolate'

url = "https://www.allrecipes.com/search?q=#{ingredient}"



arr = []

html_file = URI.open(url).read
html_doc = Nokogiri::HTML(html_file)


html_doc.search('.mntl-card.card').first(5).each do |item|
  title = item.search('.card__title-text').text

  url = item.attribute('href').value
  arr << { title: title, url: url }
end

url2 = arr.first[:url]
file = URI.open(url2).read
doc = Nokogiri::HTML(file)

rating = doc.search('.mm-recipes-review-bar__rating').text

description = doc.search('.article-subheading').text



doc.search('.mm-recipes-details__item').each do |card|

  
  if card.search('.mm-recipes-details__label').text.include?('Total Time:')
    prep_time = card.search('.mm-recipes-details__value').text
  end  
end