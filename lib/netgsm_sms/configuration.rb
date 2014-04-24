module NetGSM
  # Used to set up and modify settings for the notifier.
  class Configuration
  	attr_accessor  :host
  	attr_accessor  :port
  	attr_accessor  :usercode
  	attr_accessor  :password

  	def initialize
  		@host = 'api.netgsm.com.tr'
  		@port = 80
  	end
  end

  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield configuration
  end
end