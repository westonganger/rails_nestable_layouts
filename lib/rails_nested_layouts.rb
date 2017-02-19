require 'active_support/lazy_load_hooks'
require 'action_view'
require 'action_controller'

require 'rails_nested_layouts/version'

module RailsNestedLayouts
  module Controller
    def nested_layouts(*args)
      if args.last.is_a?(Hash)
        opts = args.pop
      end

      if args.first.is_a?(Array)
        layouts = args.first
      else
        layouts = args
      end

      send("before_#{respond_to?(:before_action) ? 'action' : 'filter'}", opts) do
        @_nested_layouts = layouts
      end
    end
  end

  module Helpers
    def yield_nested
      layouts = @_nested_layouts

      if layouts
        if layouts && layouts.empty?
          _layout_for
        else
          @_current_layout = !@_current_layout ? layouts.first : layouts[layouts.index(@_current_layout)+1]

          if @_current_layout 
            return render file: @_current_layout
          else
            @_current_layout = nil
            return _layout_for
          end
        end
      else
        _layout_for
      end
    end
  end
end

ActiveSupport.on_load :action_controller do
  ActionController::Base.send(:extend, RailsNestedLayouts::Controller)
end

ActiveSupport.on_load :action_view do
  ActionView::Base.send(:include, RailsNestedLayouts::Helpers)
end
