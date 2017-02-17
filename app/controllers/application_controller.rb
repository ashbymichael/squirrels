class ApplicationController < ActionController::Base
  include SessionsHelper
  protect_from_forgery with: :exception

  private
  def verify_logged_in
    current_user || false
  end
end
