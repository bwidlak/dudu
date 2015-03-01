module CommonStatuses
  include GetText
  
  class <<self
    def included klass
      klass.class_eval do
        extend ClassMethods
        scope :active, -> { where("status = ?", ACTIVE) }
        scope :not_active, -> { where("status =? ", NOT_ACTIVE) }
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
