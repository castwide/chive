module Chive
  class Engine < ::Rails::Engine
    isolate_namespace Chive
    initializer 'chive.action_controller' do |app|
      ActiveSupport.on_load :action_controller do
        helper Chive::ApplicationHelper
      end
    end
  end
end
