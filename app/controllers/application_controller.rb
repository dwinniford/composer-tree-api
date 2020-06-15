class ApplicationController < ActionController::API
    before_action :set_csrf_cookie
    include ActionController::Cookies
    include ActionController::RequestForgeryProtection
  
    protect_from_forgery with: :exception 

    def cookie 
        "ok"
        response.headers['Set-Cookie'] = 'Secure;SameSite=None'
    end

    private 
    def set_csrf_cookie
        cookies["CSRF-TOKEN"] = form_authenticity_token
        response.headers['Set-Cookie'] = 'Secure;SameSite=None'
    end
end
