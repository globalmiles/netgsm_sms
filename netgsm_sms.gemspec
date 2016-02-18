Gem::Specification.new do |s|
  s.name        = 'netgsm_sms'
  s.version     = '0.1.0.1'
  s.date        = '2014-04-24'
  s.summary     = "SMS sender for Turkey NetGSM!"
  s.description = "This gem is for sending SMS using NetGSM services"
  s.authors     = ["IPOS - Huseyin Gomleksizoglu"]
  s.email       = 'huseyin.gomleksizoglu@ipos.com.tr'
  s.files       = ["lib/netgsm_sms.rb","lib/core-ext/hash.rb", "lib/netgsm_sms/configuration.rb", "lib/netgsm_sms/sms.rb", "lib/netgsm_sms/date.rb", "lib/netgsm_sms/xml_body.rb"]
  s.homepage    =
    'http://rubygems.org/gems/netgsm_sms'
  s.license       = 'MIT'
end