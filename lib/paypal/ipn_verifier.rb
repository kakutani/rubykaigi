require 'net/https'
Net::HTTP.version_1_2

module Paypal
  class IPNVerifier
    def https_postback(params)
      @params = params.dup
      https = Net::HTTP.new(postback_host,443)
      https.use_ssl=true
      https_verify_mode = OpenSSL::SSL::VERIFY_PEER
      https.start do |req|
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
      postback_params.map{|k,v|"#{k}=#{v}"}.join("&")
    end
  end
end
