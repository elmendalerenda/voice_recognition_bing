# VoiceRecognitionBing

This gem uses the Microsoft Bing Voice Recognition API to transcribe and synthesize voice queries.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'voice_recognition_bing'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install voice_recognition_bing

## Configuration


To use this gem you need a `subscription_key` for Bing Speech API that can be found for free on the [Microsoft Cognitive Services website](https://www.microsoft.com/cognitive-services)


## Usage

Configure the subscription key for the gem as follows:

```ruby
VoiceRecognitionBing.configure do |config|
  config.subscription_key = "my subscription key"
end
```

To process a file the content must be stringified and a credentials object created:

```ruby
credentials = VoiceRecognitionBing::Authorization.credentials
text = VoiceRecognitionBing::Service.recognize("file content", credentials)
```

You can find an usage example here: [web api example]( https://github.com/elmendalerenda/mnemonic/blob/master/server/api.rb)

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

[![Build Status](https://travis-ci.org/elmendalerenda/voice_recognition_bing.svg?branch=master)](https://travis-ci.org/elmendalerenda/voice_recognition_bing)

