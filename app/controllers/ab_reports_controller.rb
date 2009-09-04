class AbReportsController < ApplicationController
  unloadable
  #replace this authorize method with your own if you have one already
  before_filter :authorize
  def tests
    @criteria = params["criteria"] || { "start_date" => 7.days.ago.to_s(:en), "end_date" => 1.days.ago.to_s(:en) }
    @tests = Abingo::Experiment.find(:all) #, :conditions=>["created_at>? and created_at<?",@criteria["start_date"], @criteria["end_date"]])
    
  end
  
  def gadgets
    bingo!
    redirect_to :action=>"test_ab"
  end
  
  private
  def authorize
    #if !admin?
    #  flash[:notice] = "You must be a website administrator to view reports."
    #  redirect_to new_user_session_url
    #end
  end
end