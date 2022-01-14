module Api
    class ApiController < ActionController::Base
        include AuthHelper
        
        # Skiping default auth, to implement our own on the ApiController childs
        skip_before_action :verify_authenticity_token

        # Decodes the jwt, returns 'not valid token' in case of error or invalid 
        def is_valid_jwt
            begin
                @token_decode = decode params['token']
            rescue => exception
                return render :json => { msg: 'not valid token', result: false }
            end
        end


    end
end