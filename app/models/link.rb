require 'securerandom'

class Link < ApplicationRecord
    belongs_to :user
    before_create :create_slug

  def temporal?
    type == 'TemporalLink'
  end

  def private?
    type == 'PrivateLink'
  end

  def redirect
    { success: true }
  end  

  private 

  def create_slug
    self.slug = SecureRandom.uuid[0..7]
  end

end
