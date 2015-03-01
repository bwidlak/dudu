class ImagesController < ApplicationController
  before_filter :load_category
  before_filter :load_image, :only => [:show]
  
  def index
    #@images = @category.images.active.scoped(:order => 'random()').paginate(paginate_options)
    @images = @category.images.active.paginate(page: params[:page])
    # @slideshow_images = @category.images.active.slideshow.all(:limit => 3)
  end
  
  def show
    
  end
  
  protected
  
  def load_category
    @category = Category.find_by_id(params[:category_id]) || Category.first
  end
  
  def load_image
    @image = Image.find(params[:id])
  end
end
