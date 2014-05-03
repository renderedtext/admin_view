# Configure Rails Environment
ENV["RAILS_ENV"] = "test"

require 'minitest/autorun'
require 'active_support/test_case'
require 'rails/all'
require 'rails/generators'
require 'rails/generators/test_case'
