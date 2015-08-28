#!/usr/bin/env ruby



require 'nokogiri'



teams = %W{ANA ARI BOS BUF CGY CAR CHI COL CLB DAL DET EDM FLA LAK MIN MTL NAS NJD NYI NYR OTT PHI PIT SJS STL TBL TOR VAN WAS WPG}
#teams = %W{ANA}

teams.each do |team|
  #puts "--------#{team}---------"
	html = Nokogiri::HTML(File.open(File.expand_path("get/nn_#{team}.html")))

  players = []
  html.css('a[class = "active"]').each do |player|
    name = /(?<last>[A-Za-z\-]*),.(?<first>[A-Za-z\-]*)/.match(player.text)
    unless name
      name = /(?<first>[A-Za-z\-]*) (?<last>[A-Za-z\-]*)/.match(player.text)
    end
    name2 =  "#{name['first']} #{name['last']}"
    players.push(name2)
  end
  
  salaries = []
  html.css('td[class = "caphit"]').each do |salary|
    salaries.push((salary.text.to_f * 1_000_000).to_i)
  end
  salaries2 = salaries[0...players.size]
  
  players.zip(salaries2).each do |name, salary|
    puts "#{name};#{salary};#{team}"
  end
  
end



__END__
