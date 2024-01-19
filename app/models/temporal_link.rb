class TemporalLink < Link
  validates :expiration_date, presence: true

  def redirect
    if DateTime.current <= self.expiration_date
      { success: true }
    else
      { success: false, message: 'The link has expired, it can not be accessed' }
    end
  end

end
