#!/usr/bin/env ruby



require 'open-uri'



website_url = "http://stats.nhlnumbers.com/teams"

teams = %W{ANA ARI BOS BUF CGY CAR CHI COL CLB DAL DET EDM FLA LAK MIN MTL NAS NJD NYI NYR OTT PHI PIT SJS STL TBL TOR VAN WAS WPG}

teams.each do |team|
	url = "#{website_url}/#{team}?year=2016"
	save_file = "get/nn_#{team}.html"
	File::open(save_file, 'w') do |f|
		f << open(url).read
	end
end



__END__
