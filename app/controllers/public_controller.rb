class PublicController < ApplicationController

  def index
    puts "adasdasdasd"
    @random_images = Image.random_images
    puts "isuygdfiagsdifuas"
  end

  def about
  end

end
