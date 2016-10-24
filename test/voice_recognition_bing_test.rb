require 'test_helper'
require './test/stubs'

class RecognizerTest < Minitest::Test
  include Stubs

  def setup
    VoiceRecognitionBing.configure do |config|
      config.subscription_key = 'any key'
    end
  end

  def test_obtain_token
    authorization = VoiceRecognitionBing::Authorization.new
    authorization.ms_service = stub(authenticate: 'my_token')

    assert_equal 'my_token', authorization.credentials.token
  end

  def test_empty_subscription_key
    VoiceRecognitionBing.configure do |config|
        config.subscription_key = nil
    end

    credentials = VoiceRecognitionBing::Authorization.credentials
    refute credentials.valid?
  end

  def test_authentication_fails
    authorization = VoiceRecognitionBing::Authorization.new
    authorization.ms_service = stub(authenticate: { error: '401' }.to_json)

    credentials = authorization.credentials
    refute credentials.valid?
  end

  def test_recognize_returns_the_recognized_string
    service = VoiceRecognitionBing::Service.new
    credentials = VoiceRecognitionBing::Credentials.new('any token')
    service.ms_service = stub(recognize: recognize_service_response)

    assert_equal 'hey hello', service.recognize('', credentials)
  end

  def test_recognize_raises_when_invalid_credentials
    assert_raises(VoiceRecognitionBing::InvalidCredentials) {
      VoiceRecognitionBing::Service.recognize('', VoiceRecognitionBing::NullCredentials.new)
    }
  end

  def test_integration
    skip
    VoiceRecognitionBing.configure do |config|
      config.subscription_key = ENV['subscription_key']
    end
    content = File.binread('./test/fixture/88.wav')

    credentials = VoiceRecognitionBing::Authorization.credentials({subscription_key: client_id})
    response = VoiceRecognitionBing::Service.recognize(content, credentials)

    assert_equal "ochenta y ocho", response
  end

  def recognize_service_response
    {'results' => [{'lexical' => 'hey hello'}]}.to_json
  end
end
