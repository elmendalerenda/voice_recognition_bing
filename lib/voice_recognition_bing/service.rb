module VoiceRecognitionBing
  class InvalidCredentials < StandardError; end
  class Service
    attr_writer :ms_service

    def self.recognize(content, credentials)
      new.recognize(content, credentials)
    end

    def recognize(content, credentials)
      raise InvalidCredentials unless credentials.valid?

      response = remote_service.recognize(content: content, token: credentials.token)

      parse_result(response)
    end

    private

    def parse_result(json)
      JSON.parse(json)['results'].first['lexical']
    end

    def remote_service
      @ms_service ||= MSService
    end
  end
end
