require "voice_recognition_bing/version"
require "voice_recognition_bing/configuration"
require "voice_recognition_bing/authorization"
require "voice_recognition_bing/service"

module VoiceRecognitionBing
  class << self
    attr_writer :configuration

    def configuration
      @configuration ||= Configuration.new
    end

    def reset
      @configuration = Configuration.new
    end

    def configure
      yield(configuration)
    end
  end
end
