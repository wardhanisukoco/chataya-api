class ApplicationController < ActionController::API
    include Response
    require 'securerandom'
    include ActionController::Cookies
    def session_id
        cookies[:session_id] ||= SecureRandom.uuid 
        cookies[:session_id] = {
            value: cookies[:session_id],
            same_site: :none,
            secure: true
        }
    end
end
