require 'securerandom'

class Link < ApplicationRecord
    belongs_to :user
    before_create :create_slug
    has_many :link_accesses, dependent: :destroy

    validates :type, presence: true
    validates :url, presence: true, format: {
      with: /\A(?:http[s]?:\/\/)?(?:www\.)?[\S]+\.[\S]+\z/,
      message: "is not recognized as a valid URL"
    }

    def accesses_by_day
      link_accesses.group_by { |access| access.created_at.to_date }
    end
  
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
    self.slug = SecureRandom.hex(4)
  end

end
