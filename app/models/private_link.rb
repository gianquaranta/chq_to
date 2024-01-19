class PrivateLink < Link
    has_secure_password 

  validates :password, presence: true

  def redirect(password)
    if !authenticate(password)
      { success: false, message: "The password is incorrect. Please try again." }
    else
      { success: true }
    end
  end


end
