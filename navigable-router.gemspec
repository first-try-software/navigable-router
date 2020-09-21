require_relative 'lib/navigable/router/version'

Gem::Specification.new do |spec|
  spec.name          = "navigable-router"
  spec.version       = Navigable::Router::VERSION
  spec.authors       = ["Alan Ridlehoover", "Fito von Zastrow"]
  spec.email         = ["navigable@firsttry.software"]

  spec.summary       = %q{Ahoy! Welcome aboard Navigable!}
  spec.description   = %q{A simple, highly-performant, Rack-based router.}
  spec.homepage      = "https://firsttry.software"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/first-try-software/navigable-router"
  spec.metadata["changelog_uri"] = "https://github.com/first-try-software/navigable-router/issues"

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features|assets)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'mustermann', '~> 1.1'
  spec.add_dependency 'mustermann-contrib', '~> 1.1'

  spec.add_development_dependency 'rack', '~> 2.2'
  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 12.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rspec_junit_formatter", "~>0.4"
  spec.add_development_dependency "simplecov", "~>0.17"
end
