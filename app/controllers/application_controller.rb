class ApplicationController < ActionController::API
    include Response
    require 'securerandom'
    include ActionController::Cookies
    def session_id
        cookies[:session_id] ||= {
            value: SecureRandom.uuid,
            same_site: :none,
            secure: true
        } 
    end
end
