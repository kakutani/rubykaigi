class PastKaigiController < ApplicationController
  def index
    redirect_to "http://#{params[:year]}.rubykaigi.org"
  end

end
