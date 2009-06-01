namespace :headline do
  desc "Fetch headlines from rubykaigi.tdiary.org"
  task :fetch => :environment do
    require 'open-uri'
    require 'rss'
    str = URI('http://rubykaigi.tdiary.net/index.rdf').read
    rss = RSS::Parser.parse(str)
    puts "%d items in the feed" % rss.items.size
    rss.items.each do |item|
      he = HeadlineEntry.find_by_link(item.link)
      he ||= HeadlineEntry.new
      he.update_attributes!({
        :title => item.title,
        :time => item.date.to_s,
        :link => item.link,
        :content => item.content_encoded
      })
    end
  end
end
