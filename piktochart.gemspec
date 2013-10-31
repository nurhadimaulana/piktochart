# coding: utf-8
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |spec|
  spec.name          = "piktochart"
  spec.version       = "0.0.1"
  spec.authors       = ["Nurhadi Maulana"]
  spec.email         = ["nurhadimaulana92@gmail.com"]
  spec.description   = "Gem for Piktochart - description"
  spec.summary       = "Gem for Piktochart - summary"
  spec.license       = "MIT"

  spec.files         = ["app/controllers/api/v1/users_controller.rb",
                        "app/controllers/users/invitations_controller.rb",
                        "lib/piktochart.rb",
                        "lib/social_media.rb",
                        "lib/payment.rb"
                      ]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "httparty"
  spec.add_development_dependency "devise"
  spec.add_development_dependency "devise_invitable"
  spec.add_development_dependency "koala"
  spec.add_development_dependency "twitter"
  spec.add_development_dependency "paypal-sdk-merchant"
end
