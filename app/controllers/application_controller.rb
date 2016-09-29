class ApplicationController < ActionController::Base
  require 'redisdb'
  protect_from_forgery with: :exception
end
