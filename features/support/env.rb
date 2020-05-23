require 'capybara'
require 'capybara/cucumber'
require 'capybara/rspec'
require 'httparty'
require 'selenium-webdriver'
require 'pry'
require 'site_prism'
require 'rubygems'

# referencia de onde esta o arquivo com o modulo de configuracao das apis
require_relative '../support/services/OnlineChallenge.rb'

Capybara.configure do |config|
  config.default_driver = :selenium_chrome
  config.app_host = 'https://webmotors.com.br/'
end

Capybara.default_max_wait_time = 10

API_STANDARD_DATA = YAML.load_file(File.dirname(__FILE__) + '/data/standard.yaml')

RSpec.configure do
  # modulo global onde esta as configuracoes do httparty
  include OnlineChallenge
end
