class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_action :shared_stuff
  def shared_stuff
    #@year = '2013-2014'
    #@year = '2014-2015'
    @year = '2015-2016'
    case @year
    when '2014-2015'
      @teams = ['Avalanche', 'Blackhawks', 'Bluejackets', 'Blues', 'Bruins', 'Canadiens', \
      'Canucks', 'Capitals', 'Coyotes', 'Devils', 'Ducks', 'Flames', 'Flyers', 'Hurricanes', \
      'Islanders', 'Jets', 'Kings', 'Lightning', 'Mapleleafs', 'Oilers', 'Panthers', 'Penguins', \
      'Predators', 'Rangers', 'Redwings', 'Sabres', 'Senators', 'Sharks', 'Stars', 'Wild']
    when '2015-2016'
      @teams = %W{ANA ARI BOS BUF CGY CAR CHI COL CLB DAL DET EDM FLA LAK MIN MTL NAS NJD NYI NYR OTT PHI PIT SJS STL TBL TOR VAN WAS WPG}
    end
  end
end
