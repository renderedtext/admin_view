require File.join(File.dirname(__FILE__), 'test_helper')
 
require 'generators/admin_view_generator'
 
class AdminViewGeneratorTest < Rails::Generators::TestCase

  destination File.expand_path("../tmp", File.dirname(__FILE__))
  setup :prepare_destination
  tests AdminViewGenerator
 
  test "create the standard assets" do
    run_generator %w(User)

    assert_file "app/controllers/admin/base_controller.rb", /class Admin::BaseController < ApplicationController/
  end
end
