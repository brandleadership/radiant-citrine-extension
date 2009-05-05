# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class CitrineExtension < Radiant::Extension
  version "1.0"
  description "Extension for the citrine multi site platform"
  url "http://www.screenconcept.ch"
  
  # define_routes do |map|
  #   map.namespace :admin, :member => { :remove => :get } do |admin|
  #     admin.resources :citrine
  #   end
  # end
  
  def activate
    # admin.tabs.add "Citrine", "/admin/citrine", :after => "Layouts", :visibility => [:all]
    Page.send :include, CitrineTags
  end
  
  def deactivate
    # admin.tabs.remove "Citrine"
  end
  
end
