class PrivateLink < Link
    has_secure_password # Esto requiere que tengas el gem 'bcrypt' en tu Gemfile

  # Otros validaciones y relaciones

  validates :password, presence: true

  def redirect
    if !@link.authenticate(params[:password])
        {success: false, message: "The password is incorrect. Please try again."}
    else
        {success: true}
    end
  end


end
