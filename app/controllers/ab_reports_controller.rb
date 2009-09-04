class AbReportsController < ApplicationController
  unloadable
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
    flash[:notice] = "You must be a website administrator to view reports."
    #redirect_to new_user_session_url unless admin?
  end
end
=begin
suggested styles:

table { font-size: 11px; font-family:arial; border:solid 1px #888;border-right:none; }
th { border-bottom: solid 1px #666;border-right: solid 1px #888; background: #ddd;}
td { border-right: solid 1px #888; text-align: right;}
tr.total td { border-top:solid 1px #666; font-weight:bold;}

=end