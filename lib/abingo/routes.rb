class Abingo
  class Routes
    def self.reports_ui(map, options={})
      map.with_options(options.merge(:controller => 'ab_simulations')) do |t|
        t.score_test 'ab/simulations/:action' #, :action=>'index'
        t.simulations 'ab/simulations', :action=>"index"
      end
      map.with_options(options.merge(:controller => 'ab_reports')) do |t|
        t.connect '/ab/:action'
#        t.translate_reload 'translate/reload', :action => 'reload'
#        t.translate_edit 'translate/edit', :action => 'edit'
      end

    end
  end
end
