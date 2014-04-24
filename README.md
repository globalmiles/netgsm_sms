

require 'netgsm_sms.rb'

NetGSM.configure do |config|
	config.usercode = '1234'
	config.password = '1234'
end

puts NetGSM::SMS.send_sms('123','test',:from => 'COMPANY', :turkish => true)

puts NetGSM::SMS.send_mass_sms([['123','test'],['124', 'test1'],['125','test2']],{ :from => 'COMPANY', :turkish => true })

Versions
========
0.1
- Mass support for n..n (different message to each recepient) added

0.0.7 
- Bug Fix
- send_sms function
- Turkish support for sms messages