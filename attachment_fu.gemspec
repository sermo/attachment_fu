# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name          = 'attachment_fu'
  s.version       = '1.0.1.sermo'
  s.summary       = "Sermo fork of attachment_fu"
  s.description   = "Sermo fork of attachment_fu"
  s.authors       = ["technoweenie"]
  s.email         = 'technoweenie@technoweenie.com'
  s.homepage      = 'https://github.com/technoweenie/attachment_fu/'
  s.files         = Dir['lib/**/*'] + Dir['vendor/**/*'] + Dir['test/**/*'] + ['README', 'amazon_s3.yml.tpl']
  s.require_paths = ['lib']

  s.add_development_dependency('rspec-rails')
  s.add_development_dependency('rails', '3.0.10')
  s.add_development_dependency('rspec', '~> 2.7.0')
  s.add_development_dependency("mocha", "~> 0.9.7")
end
