class PublicController < ApplicationController
  def index
    @random_images = Image.random_images
  end

end
