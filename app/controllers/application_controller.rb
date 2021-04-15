class ApplicationController < ActionController::Base
  add_flash_types :info, :success

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end
end
