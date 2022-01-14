module Api
  class AuthController < ApiController
    include AuthHelper
        
    def login 
      payload = { :result => false, :errors => ['User or password not valid'] }
      user = User.find_by_username(params['username'])

      if user and user.role = 1 
        payload = payload_from(user) if user.authenticate(params['password'])
      end

      render :json => payload
    end

    def signin
      user = User.new_by params
      result = user.save if user.valid 
      render :json => { :errors => user.errors, :result => result }
    end

    private 
    def payload_from (user) 
      jwt = {
        :id => user[:id], 
        :username => user[:username], 
        :name => user[:name]
      }

      { :result => true, :token => encode(jwt) }
    end
  end
end