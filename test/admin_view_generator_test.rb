require File.join(File.dirname(__FILE__), 'test_helper')
 
require 'generators/admin_view_generator'
 
class AdminViewGeneratorTest < Rails::Generators::TestCase

  destination File.expand_path("../tmp", File.dirname(__FILE__))
  setup :prepare_destination
  tests AdminViewGenerator
 
  test "create the controllers and specs" do
    run_generator %w(User --search_by email)

    assert_file "app/controllers/admin/base_controller.rb", /class Admin::BaseController < ApplicationController/
    assert_file "app/controllers/admin/users_controller.rb", /class Admin::UsersController < Admin::BaseController/
    assert_file "spec/controllers/admin/base_controller_spec.rb", /describe Admin::BaseController do/
    assert_file "spec/controllers/admin/users_controller_spec.rb", /describe Admin::UsersController do/
  end
end
