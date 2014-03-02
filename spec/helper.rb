require 'simplecov'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
  SimpleCov::Formatter::HTMLFormatter,
]

SimpleCov.start do
  add_filter '/spec/'
  minimum_coverage(98)
end

require 'open_civic_data'
require 'rspec'
require 'webmock/rspec'

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

def a_get(path)
  a_request(:get, OpenCivicData.endpoint + path)
end

def stub_get(path, options)
  stub_request(:get, OpenCivicData.endpoint + path).with(query: options)
end

def fixture_path
  File.expand_path('../fixtures', __FILE__)
end

def fixture(file)
  File.new(fixture_path + '/' + file)
end
