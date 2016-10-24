module VoiceRecognitionBing
  class Credentials < Struct.new(:token)
    def valid?
      !token.nil? && !token.empty?
    end
  end

  class NullCredentials
    def valid?
      false
    end
  end
end

