class ApplicationController < ActionController::Base
  rescue_from ActionView::MissingTemplate do |exception|
    render '404'
  end
end
