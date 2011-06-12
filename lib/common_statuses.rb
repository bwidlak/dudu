module CommonStatuses
  include GetText
  
  class <<self
    def included klass
      klass.class_eval do
        extend ClassMethods
        named_scope :active, :conditions => {:status => ACTIVE}
        named_scope :not_active, :conditions => {:status => NOT_ACTIVE}
      end
    end
  end
  
  module ClassMethods
    def statuses
      STATUSES
    end
  end
  
  def display_status
    self.class.statuses.index(status)
  end
  
  ACTIVE = 1
  NOT_ACTIVE = 2
  
  STATUSES = {
    _('Aktywny') => ACTIVE,
    _('Nie aktywny') => NOT_ACTIVE,
  }
end
