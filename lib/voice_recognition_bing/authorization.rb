require 'json'

require 'voice_recognition_bing/ms_service'
require 'voice_recognition_bing/credentials'

module VoiceRecognitionBing
  class Authorization
    attr_writer :ms_service
    def self.credentials
      new.credentials
    end

    def credentials
      return NullCredentials.new unless valid_params

      response = remote_service.authenticate(subscription_key: VoiceRecognitionBing.configuration.subscription_key)

      Credentials.new(extract_token(response))
    end

    private

    def extract_token(string)
      return String.new if string =~ /"error":/

      string
    end

    def valid_params
      !VoiceRecognitionBing.configuration.subscription_key.nil?
    end

    def remote_service
      @ms_service ||= MSService
    end
  end
end
