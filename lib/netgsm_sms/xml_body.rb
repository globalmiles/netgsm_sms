module NetGSM
	class XmlBody
		def self.send_sms_body(recipient, message_text, valid_options)
			"<?xml version='1.0'?>
		 	<mainbody>
		 	<header>
		 	 	<company #{"dil='TR'" if valid_options[:turkish] == true}>NETGSM</company>
		 	 	<usercode>#{NetGSM.configuration.usercode}</usercode>
		 	 	<password>#{NetGSM.configuration.password}</password>
		 	 	<startdate>#{valid_options[:start_date]}</startdate>
		 	 	<stopdate>#{valid_options[:stop_date]}</stopdate>
		 	 	<type>1:n</type>
		 	 	<msgheader>#{valid_options[:from]}</msgheader>
		 	</header>	 
		 	<body>
		 	 	<msg><![CDATA[#{message_text}]]></msg>
		 	 	<no>#{recipient}</no>
		 	</body>	 
		 	</mainbody>"
		end

		def self.send_mass_sms_body(message_array, valid_options)
			result = "<?xml version='1.0'?>
		 	<mainbody>
		 	<header>
		 	 	<company #{"dil='TR'" if valid_options[:turkish] == true}>NETGSM</company>
		 	 	<usercode>#{NetGSM.configuration.usercode}</usercode>
		 	 	<password>#{NetGSM.configuration.password}</password>
		 	 	<startdate>#{valid_options[:start_date]}</startdate>
		 	 	<stopdate>#{valid_options[:stop_date]}</stopdate>
		 	 	<type>n:n</type>
		 	 	<msgheader>#{valid_options[:from]}</msgheader>
		 	</header>	 
		 	<body>
		 		" + message_array.map {|message| "<mp><msg><![CDATA[#{message[1]}]]></msg><no>#{message[0]}</no></mp>" }.join("\n") + "
		 	</body>	 
		 	</mainbody>"

		 	puts result
		 	return result
		end
	end
end