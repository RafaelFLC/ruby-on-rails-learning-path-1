module AuthHelper
  def encode (to_encode) 
      JWT.encode(to_encode, Rails.application.config.secret, 'HS256')
  end

  def decode (token) 
      JWT.decode(token, Rails.application.config.secret, true)[0]
  end
end