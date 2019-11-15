class StaticController < ApplicationController

  def show
    render params[:url]
  end

end
