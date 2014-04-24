require 'net/http'
require 'net/https'
require 'core-ext/hash'

require 'netgsm_sms/configuration'
require 'netgsm_sms/sms'
require 'netgsm_sms/date'
require 'netgsm_sms/xml_body'

module NetGSM
  def self.root
    File.expand_path('../..', __FILE__)
  end
end

