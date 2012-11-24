require 'rspec'

require 'debugger'
require 'simplecov'

SimpleCov.start do
  add_filter "/spec/"
end

require 'googlon-scroll'

def load_fixture(filename)
  File.open(File.expand_path("../fixtures/#{filename}", __FILE__), 'r').read
end
