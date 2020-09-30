require_relative 'lib/stealth/services/postback/version'

Gem::Specification.new do |spec|
  spec.name          = 'stealth-postback'
  spec.version       = Stealth::Services::Postback::VERSION
  spec.authors       = ['Léo Figea', 'Barkibu']
  spec.email         = ['leo@barkibu.com']

  spec.summary       = 'Postback driver for Stealth'
  spec.description   = 'Simple Driver to post back to a specified url'
  spec.homepage      = 'http://github/barkibu/stealth-postback'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.3.0')

  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  # spec.metadata["homepage_uri"] = spec.homepage
  # spec.metadata["source_code_uri"] = "TODO: Put your gem's public repo URL here."
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'api-auth', '~> 2.4'
  spec.add_dependency 'rest-client', '~> 2.1'
  spec.add_dependency 'stealth', '>= 2.0.0.beta'

  spec.add_development_dependency 'json-schema'
  spec.add_development_dependency 'rspec', '~> 3.2'
end
