# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'voice_recognition_bing/version'

Gem::Specification.new do |spec|
  spec.name          = "voice_recognition_bing"
  spec.version       = VoiceRecognitionBing::VERSION
  spec.authors       = ["Miguel Angel Fernandez"]

  spec.summary       = %q{Client for the Voice Recognition service of Bing}
  spec.homepage      = "https://github.com/elmendalerenda/voice_recognition_bing"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.files         = Dir["lib/**/*.rb"]
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"

  spec.add_dependency "httparty", "~> 0.14"
end
