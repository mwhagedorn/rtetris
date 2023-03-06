# frozen_string_literal: true

require_relative "lib/rtetris/version"

Gem::Specification.new do |spec|
  spec.name = "rtetris"
  spec.version = Rtetris::VERSION
  spec.authors = ["Mike Hagedorn"]
  spec.email = ["mike@silverchairsolutions.com"]

  spec.summary = "Simple code to calculate the height of the tetris stack"
  spec.description = "Implement code to calculate the height of a tetris stack"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"



  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
