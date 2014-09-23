class UsersController < ApplicationController

	def gather
		company = params[:c]
		user_agent = request.env["HTTP_USER_AGENT"]
		ip = request.remote_ip
		browser = /(opera|chrome|safari|firefox|msie|trident)\/[^ ]*/i.match(user_agent).to_s.gsub("/", " ")
		os = /(Mac|Windows|Linux|Android|CPU|Blackberry) \w[^;)]*/i.match(user_agent).to_s

		User.create( company: company,
								 user_agent: user_agent,
								 ip_address: ip,
								 browser: browser,
								 operating_system: os )

		# render whatever
	end

end