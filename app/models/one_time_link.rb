class OneTimeLink < Link

    def redirect
      if LinkAccess.exists?(link_id: self.id)
        { success: false, status: 403 }
      else
        { success: true }
      end
    end
    
  end
  