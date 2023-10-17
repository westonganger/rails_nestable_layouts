#!/usr/bin/env ruby -w

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'yaml'
require 'minitest'

require 'rails_nestable_layouts'

require 'minitest/autorun'

class Test < Minitest::Test
  def setup
  end

  def test_helper_methods
    if ActionView::VERSION::STRING.to_f >= 6.1
      view_instance = ActionView::Base.new(nil, {}, nil)
    else
      view_instance = ActionView::Base.new
    end

    view_instance.yield_nested

    assert_raises ArgumentError do
      view_instance.yield_nested(true)
    end
  end

  def test_controller_methods
    assert_raises NoMethodError do
      RailsNestableLayouts::Controller.nested_layouts
    end

    ActionController::Base.nested_layouts
    ActionController::Base.nested_layouts 'foo'
    ActionController::Base.nested_layouts :bar
    ActionController::Base.nested_layouts 'foo', :bar
    ActionController::Base.nested_layouts 'foo', :bar, :foo
    ActionController::Base.nested_layouts ['foo', :bar]
    ActionController::Base.nested_layouts :foo, :bar, only: [:bar]
    ActionController::Base.nested_layouts [:foo, :bar], except: [:foo]
  end

  def test_exposes_version
    assert !RailsNestableLayouts::VERSION.nil?
  end

  def teardown

  end

end
