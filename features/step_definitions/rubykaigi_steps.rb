# -*- coding: utf-8 -*-

When(/RubyKaigi(\d{4})の"(\w+)"にアクセスする/)do |year, page|
  path = [year, path_to(page)].compact.join("/")
  visit "/#{path}"
end


#------------------------------------------------------------------------------
# for login_with_openid.feature
#------------------------------------------------------------------------------
前提(/^新規アカウント"(.+)"の作成を試みる/) do |account|
  @identity_url = Factory.attributes_for(account.to_sym)[:identity_url]
end

もし(/^OpenIDでrubykaigi.orgにサインイン/) do
  fill_in "OpenID", :with => @identity_url
  submit_form "signin"
end

もし(/^OpenID Providerで認証に成功する/) do
  openid_auth = URI(response.headers["Location"])
  openid_authorized_query = nil
  Net::HTTP.start(openid_auth.host, openid_auth.port) do |h|
    res = h.get(openid_auth.request_uri)
    auth_form = Nokogiri::HTML(res.body).css("form").first

    auth_req = Net::HTTP::Post.new(auth_form["action"])
    auth_req["cookie"] = res["set-cookie"]
#    auth_req.body = success ? "yes=yes" : "yes=no"
    auth_req.body = true ? "yes=yes" : "yes=no"
    auth_res = h.request(auth_req)
    openid_authorized_query = auth_res["location"]
  end

  get_via_redirect URI(openid_authorized_query).request_uri
end

ならば /^OpenIDのURLが表示されていること$/ do
  response.should contain(@identity_url)
end

# taken from openskip feature (thanks to moro)
# http://github.com/openskip/skip-note/blob/e6bf0efe6db725e3db8db71bad19003b266611d7/features/step_definitions/openid_fake_steps.rb
# require 'net/http'

# def authenticate_with_fake_open_id_server(ident_url, success = true)
#   visit(login_path)
#   doc = Nokogiri::HTML(response.body)
#   f = doc.css("form").detect{|form| !form.css("input[name=openid_url]").empty? }
#   post(f["action"], :openid_url => ident_url)

#   oid_auth = URI(response.headers["Location"])
#   oid_authorized_query = nil
#   Net::HTTP.start(oid_auth.host, oid_auth.port) do |h|
#     res = h.get(oid_auth.request_uri)

#     auth_form = Nokogiri::HTML(res.body).css("form").first

#     auth_req = Net::HTTP::Post.new(auth_form["action"])
#     auth_req["cookie"] = res["set-cookie"]
#     auth_req.body = success ? "yes=yes" : "yes=no"

#     auth_res = h.request(auth_req)
#     oid_authorized_query = auth_res["location"]
#   end

#   visit( URI(oid_authorized_query).request_uri )
# end

# success = lambda{|n| authenticate_with_fake_open_id_server(n) }
# failure = lambda{|n| authenticate_with_fake_open_id_server(n, false) }

# Given(/\AI log in with OpenId "(.*)"$/, &success)
# Given(/\AOpenId "(.*)"でログインする$/, &success)
# Given(/\AOpenId "(.*)"でログイン失敗する$/, &failure)
