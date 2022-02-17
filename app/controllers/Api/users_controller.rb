module Api
  class UsersController < ApiController
    def create
      user = User.new user_params

      #Users created by the api will be normal users by default
      user.role = 2 

      result = user.save ? 
        { msg: 'saved successfuly', result: true } : 
        { msg: 'there was an error', errors: user.errors, result: false }

      render :json => result
    end

    private 
    def user_params 
      params.permit(:id, :name, :lastname, :username, :password, :password_confirmation )
    end
  end
end