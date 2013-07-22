Gem::Specification.new do |gem|
  gem.name         = "synergy"
  gem.version      = "1"

  gem.authors      = ["Janko Marohnić"]
  gem.email        = ["janko.marohnic@gmail.com"]
  gem.description  = "A common engine for 2 similar websites."
  gem.summary      = gem.description
  gem.homepage     = "https://github.com/twin/synergy"

  gem.license      = "MIT"

  gem.files        = Dir["**/*"] - ["Rakefile", "synergy.gemspec", "Gemfile", "Gemfile.lock"]
  gem.require_path = "lib"

  gem.add_development_dependency "rake"
end
