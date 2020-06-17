class ApplicationController < ActionController::API
    before_action :set_csrf_cookie
    include ActionController::Cookies
    include ActionController::RequestForgeryProtection
  
    protect_from_forgery with: :exception 

    def cookie 
        "ok"
        # response.headers['Set-Cookie'] = 'SameSite=None; Secure'
        pp response.headers 
        # A cookie associated with a resource at http://song-web.herokuapp.com/ was set with `SameSite=None` but without `Secure`.
        # looks like this: "Set-Cookie"=>"SameSite=None;Secure"
    end

    private 
    def set_csrf_cookie
        # cookies["CSRF-TOKEN"] = form_authenticity_token
        response.headers['Set-Cookie'] = "CSRF-TOKEN=#{form_authenticity_token}; SameSite=None; Secure"
       
    end
end
