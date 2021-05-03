class Scraper 
  require 'nokogiri'
  require 'open-uri'
  require 'byebug'

  def self.scrape_books
    doc = Nokogiri::HTML(open("https://www.oberlo.com/blog/must-read-books-of-all-time"))
    doc_css = doc.css('div.single-post')
    doc_css_h6 = doc.css('div.single-post h6')
    books = {}

    #get book title and author
    count = 0
    doc_css_h6[0..39].each do |book|

      split = book.text.split(" by ")
      split_name = split[0].split(". ")

      books.store("#{count + 1}", {title: "#{split_name[1]}", author: "#{split[1]}"})
      count += 1 
    end

    count = 1
    #get description and title
    doc_css.css('p')[4..86].each_with_index do |book, index|
      if index % 2 == 0 
        image_link = book.css('img').attr('src')
        image_link ? books["#{count}"][:image] = image_link.value : nil
        count += 1 
      else
        count <= 40 ? books["#{count}"][:description] = book.text : nil
      end
    end

    f = File.open("forty_books.txt", "w")

    f.puts books
    f.close
  end


end