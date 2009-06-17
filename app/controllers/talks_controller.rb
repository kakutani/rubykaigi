class TalksController < ApplicationController

  def index
    @talks = Talk.all
  end

  def show
    @talk = Talk.find(params[:id])
  end

end
