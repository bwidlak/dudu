class Contact < Struct.new(:name, :body, :phone, :id)
  include Validatable
  module ActiveRecordMethods
    def self.included klass
      klass.send :extend, ClassMethods
    end
    def new_record?
      true
    end
    def initialize options={}
      options.each{ |key, value| self.send(:"#{key}=", value) } unless options.blank?
    end
    module ClassMethods
      def human_name; end
    end
  end
  include ActiveRecordMethods
  
  validates_presence_of :name, :body, :phone, :message => 'nie może być puste'
end
