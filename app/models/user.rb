class User < StaticModel::Base

  set_data_file 'config/data/users.yml'

  def authenticate(password, user)
    if BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end

  # def authenticate(password)
  #   if user && user.password_digest == BCrypt::Engine.hash_secret(password, user.password_digest)
  #     BCrypt::Password.new(self.password_digest) == password
  #     user
  #   else
  #     nil
  #   end
  # end

  
end
