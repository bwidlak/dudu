class Contact

  include ActiveModel::Model
  attr_accessor :name, :phone, :body

  validates_presence_of  :name, :phone, :body

end
