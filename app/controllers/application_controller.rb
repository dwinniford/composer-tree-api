class ApplicationController < ActionController::API
    before_action :set_csrf_cookie
    include ActionController::Cookies
    include ActionController::RequestForgeryProtection
  
    protect_from_forgery with: :exception 

    def cookie 
        "ok"
    end

    private 
    def set_csrf_cookie
        # cookies["CSRF-TOKEN"] = form_authenticity_token
        # binding.pry 
        # set domain dynamically by env?
        # if Rails.env == "production"
        #     domain = "songweb.app"
        # elsif Rails.env == "development"
        #     domain = "localhost"
        # end
        cookies["CSRF-TOKEN"] = {
            value: form_authenticity_token,
            domain: :all 
        }
    end
end
