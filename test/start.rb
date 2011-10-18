begin
  require 'rubygems'
rescue
  puts "[!] Couldn't require Rubygems, please make sure all required libraries are in the load path"
end

require 'bacon'
require 'facon'

$:.unshift(File.expand_path('../../lib', __FILE__))
require 'broach'

module BroachTestHelpers
  def settings
    @settings ||= YAML.load_file(File.expand_path('../../settings.yml', __FILE__))
  end
  
  def mock_response(path, payload)
    Broach.session.stub!(:get).with(path).and_return(payload)
  end
end

class Bacon::Context
  include BroachTestHelpers
end

Bacon.extend Bacon::TapOutput