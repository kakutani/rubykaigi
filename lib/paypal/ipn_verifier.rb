require 'net/https'
Net::HTTP.version_1_2

module Paypal
  class IPNVerifier
    def https_postback(params)
      @params = params.dup
      https_client.start do |req|
        res = req.post(postback_request_uri,postback_submit_data)
        @postback_result = res.body
      end
    end

    def verified?
      @postback_result == "VERIFIED"
    end

    def invalid?
      @postback_result == "INVALID"
    end

    private
    def postback_host
      @postback_host ||= URI.parse(configatron.paypal.base_url).host
    end

    def postback_request_uri
      @postback_requiest_uri ||= configatron.paypal.request_uri
    end

    def postback_params
      @params.merge({"cmd" => "_notify-validate"})
    end

    def postback_submit_data
      postback_params.map{|k,v|"#{k}=#{CGI.escape(v)}"}.join("&")
    end

    def https_client
      client = Net::HTTP.new(postback_host,443)
      client.use_ssl = true
      client.verify_mode = OpenSSL::SSL::VERIFY_PEER
      client.ca_file = File.expand_path("cacert.pem", File.join(File.dirname(__FILE__), "..", "..", "config"))
      client
    end
  end
end
