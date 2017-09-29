require "active_support/configurable"

module SenjuKanNon
  def self.configure(&block)
    yield @config ||= SenjuKanNon::Configuration.new
  end

  def self.config
    @config
  end

  class Configuration
    include ::ActiveSupport::Configurable
    config_accessor :file_output
    config_accessor :file_output_path
    config_accessor :file_output_extension
    config_accessor :use_file
  end

  configure do |config|
    config.file_output = false
    config.file_output_path = "test/senju_kan_non/"
    config.file_output_extension = "txt"
    config.use_file = true
  end
end
