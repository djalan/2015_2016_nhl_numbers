#!/usr/bin/env ruby



require 'nokogiri'



teams = %W{ANA ARI BOS BUF CGY CAR CHI COL CLB DAL DET EDM FLA LAK MIN MTL NAS NJD NYI NYR OTT PHI PIT SJS STL TBL TOR VAN WAS WPG}
#teams = %W{TBL}

teams.each do |team|
  puts "--------#{team}---------"
	html = Nokogiri::HTML(File.open(File.expand_path("get/nn_#{team}.html")))
  
  go = false
  html.xpath('//table//tbody//tr').each do |row| 
    header = row.css('td[colspan="3"]')
    case header.text
    when "Forwards", "Defencemen", "Goaltenders"
      go = true
      next
    when "Other"
      break
    end
    
    if go
      name = /(?<last>[A-Za-z\-]*),.(?<first>[A-Za-z\-]*)/.match( row.css('td a').text )
      unless name
        name = /(?<first>[A-Za-z\-]*) (?<last>[A-Za-z\-]*)/.match( row.css('td a').text )
      end
      puts "#{name['first']} #{name['last']};#{(row.css('td[class="caphit"]').text.to_f * 1_000_000).to_i};#{team}"
    end
    
  end
  
end #teams.each



__END__
