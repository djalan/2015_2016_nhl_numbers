#!/usr/bin/env ruby



require 'nokogiri'


LAST = 30

DEFENDERS_GOAL_VALUE = 2
DEFENDERS_ASSIST_VALUE = 1
FORWARDS_GOAL_VALUE = 2
FORWARDS_ASSIST_VALUE = 1



puts "rank;name;old_team;pos;gp;goals;assists;points;f_goals;f_assists;f_points;pm;ppg;shg;f_shg;gw;ot"

for i in (1..LAST)
	html = Nokogiri::HTML(File.open(File.expand_path("get/nhl_#{i}.html")))
	table = html.css('tbody tr')
	table.each do |player|
		cols = player.css('td')

		rank = cols[0].text.to_i
		name = cols[1].text
		old_team = cols[2].text
		pos = cols[3].text
		gp = cols[4].text.to_i
		goals = cols[5].text.to_i
		assists = cols[6].text.to_i
		points = cols[7].text.to_i
    pm = cols[8].text.to_i
    #pim = cols[9].text.to_i
    ppg = cols[10].text.to_i
    #ppp = cols[11].text.to_i
    shg = cols[12].text.to_i
    #shp = cols[13].text.to_i
    gw = cols[14].text.to_i
    ot = cols[15].text.to_i
		
		f_goals = f_assists = f_points = 0
		if pos == 'D'
			f_goals = goals * DEFENDERS_GOAL_VALUE
			f_assists = assists * DEFENDERS_ASSIST_VALUE
		elsif pos =~ /C|R|L/
			f_goals = goals * FORWARDS_GOAL_VALUE
			f_assists = assists * FORWARDS_ASSIST_VALUE
		end
		f_points = f_goals + f_assists
    f_shg = shg * 2


		puts "#{rank};#{name};#{old_team};#{pos};#{gp};#{goals};#{assists};#{points};#{f_goals};#{f_assists};#{f_points};#{pm};#{ppg};#{shg};#{f_shg};#{gw};#{ot}"
	end
end
