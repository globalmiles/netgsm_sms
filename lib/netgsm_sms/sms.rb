module NetGSM
	class SMS
		def self.send_sms(recipient, message_text, opts={})
			valid_options = opts.only(:from, :start_date, :stop_date, :turkish)
			valid_options.merge!(:start_date => NetGSM::DATE.now) unless valid_options[:start_date]
			valid_options.merge!(:stop_date => NetGSM::DATE.n_hour_from_now(1)) unless valid_options[:stop_date]

			body = NetGSM::XmlBody.send_sms_body(recipient, message_text, valid_options)

			response = send_request(body)

			result = parse_response(response)
			return {code: result[0], sms_id: result[1]}
		end

		# message_array format [[phone_number, 'sms message body']]
		def self.send_mass_sms(message_array = [], opts={})
			valid_options = opts.only(:from, :start_date, :stop_date, :turkish)
			valid_options.merge!(:start_date => NetGSM::DATE.now) unless valid_options[:start_date]
			valid_options.merge!(:stop_date => NetGSM::DATE.n_hour_from_now(1)) unless valid_options[:stop_date]

			body = NetGSM::XmlBody.send_mass_sms_body(message_array, valid_options)

			response = send_request(body)

			result = parse_response(response)
			return {code: result[0], sms_id: result[1]}
		end

		def self.send_otp(recipient, message_text, opts={})
			valid_options = opts.only(:from, :start_date, :stop_date, :turkish)
			valid_options.merge!(:start_date => NetGSM::DATE.now) unless valid_options[:start_date]
			valid_options.merge!(:stop_date => NetGSM::DATE.n_hour_from_now(1)) unless valid_options[:stop_date]

			body = NetGSM::XmlBody.send_otp_body(recipient, message_text, valid_options)

			response = send_otp_request(body)

			return response
		end

		def sms_status
			'OK status'
		end

		def check_balance
			'OK Balance'
		end

		def initialize(auth_options={})
			@auth_options = auth_options
		end

		def self.send_request(body)
		    header = { 
		      "Content-Type" => "text/xml; charset=utf-8", 
		      "Content-Length" => body.bytesize.to_s, 
		      "Accept" => "*/*" 
		    }

		    request = Net::HTTP::Post.new('/xmlbulkhttppost.asp', header)
		    request.body = body
		    #puts  "Request #{@header} #{request.body} "
		    response = Net::HTTP.new(NetGSM.configuration.host, NetGSM.configuration.port).start {|http| http.request(request) }
		    #puts "Response #{response.code} #{response.message}: #{response.body}"

		    # parser = XMLRPC::XMLParser::REXMLStreamParser::StreamListener.new
		    # parser.parse(response.body)

		    return response.body
		end

		def self.send_otp_request(body)
			header = {
				"Content-Type" => "text/xml; charset=utf-8",
				"Content-Length" => body.bytesize.to_s,
				"Accept" => "*/*"
			}

			request = Net::HTTP::Post.new('/sms/send/otp', header)
			request.body = body
			response = Net::HTTP.new(NetGSM.configuration.host, NetGSM.configuration.port).start {|http| http.request(request) }

			return response.body
		end

		def self.parse_response(body)
			body.split(" ")
		end
	end
end