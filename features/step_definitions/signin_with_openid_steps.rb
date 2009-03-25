# -*- coding: utf-8 -*-
前提(/^アカウント"(.+)"でのサインインを試みる/) do |account|
  @identity_url = Factory.attributes_for(account.to_sym)[:identity_url]
end

もし(/^OpenIDでrubykaigi.orgにサインイン/) do
  fill_in "OpenID", :with => @identity_url
  submit_form "signin"
end

もし(/^OpenID Providerで認証に成功する/) do
  url = response.headers["Location"]
  authorized_uri = authenticate_with_fake_open_id_server(url, :success)
  get_via_redirect authorized_uri
end

もし(/^OpenID Providerで認証に失敗する/) do
  url = response.headers["Location"]
  authorized_uri = authenticate_with_fake_open_id_server(url, :fail)
  visit authorized_uri
end


ならば(/^OpenIDのURLが表示されていること$/) do
  response.should contain(@identity_url)
end

ならば(/^アカウントが作成されていること$/) do
  account = Account.find_by_identity_url(@identity_url)
  account.should_not be_nil
end
