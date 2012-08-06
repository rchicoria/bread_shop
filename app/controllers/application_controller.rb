class ApplicationController < ActionController::Base
  protect_from_forgery

  # Force redirect to root page for not-allowed accesses
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = exception.message
    redirect_to root_url
  end
end
