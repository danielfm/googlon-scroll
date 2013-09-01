require 'rspec'
require 'debugger'

require 'googlon-scroll'

def load_fixture(filename)
  File.open(File.expand_path("../fixtures/#{filename}", __FILE__), 'r').read
end
