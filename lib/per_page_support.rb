module PerPageSupport
  class <<self
    def included klass
      klass.send :extend, ClassMethods
    end
  end
  
  def per_page
    self.class.per_page
  end

  def paginate_options
    {:page => params[:page], :per_page => per_page}
  end

  module ClassMethods
    def per_page value=nil
      @per_page ||= value || 25
    end
  end
end
