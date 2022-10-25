class ApplicationController < ActionController::API
    include Response
    require 'securerandom'
    include ActionController::Cookies
    def session_id
        cookies[:session_id] ||= SecureRandom.uuid 
    end
end
