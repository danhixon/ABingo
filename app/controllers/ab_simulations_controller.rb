# this controller is kind of just for fun to build some simulated data.
# visit /ab/simulations, refresh the page and click the links willy-nilly
# and the data will be added to your database.  
#
# You may wish to lock this down with a before_filter like the reports controller
# 
class AbSimulationsController < ApplicationController
  unloadable
  def index
    reset_session
  end
  def gadgets
    bingo!("Gadget Give-Away")
    redirect_to :action=>"index"
  end
  def offer
    bingo!("August 2009 Offer")
    redirect_to :action=>"index"
  end
  def price
    bingo!("September 2009 Price Offer")
    redirect_to :action=>"index"
    
  end
  private
  def reset_session
    Abingo.identity = session[:abingo_identity] = rand(10 ** 10).to_i
  end
end