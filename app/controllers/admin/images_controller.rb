class Admin::ImagesController < Admin::BaseController
  before_filter :load_image, :only => [:show, :edit, :update, :destroy]

  def multi_change
    @images = Image.multi_update params[:images], params[:actions]
    redirect_to admin_images_url
  end

  def index
    @images = Image.paginate(:page => params[:page])
  end

  def show
  end

  def new
    @image = Image.new
  end

  def edit
  end

  def create
    @image = Image.new(image_params)

    if @image.save
      flash[:notice] = 'Image was successfully created.'
      redirect_to(admin_image_url(@image))
    else
      render :action => "new"
    end
  end

  def update
    if @image.update_attributes(image_params)
      flash[:notice] = 'Image was successfully updated.'
      redirect_to(admin_image_url(@image))
    else
      render :action => "edit"
    end
  end

  def destroy
    @image.destroy
    redirect_to(admin_images_url)
  end

  private

  def load_image
    @image = Image.find(params[:id])
  end

  def image_params
    params.require(:image).permit(:body, :status, :img_id, :url, :category_id, :thumbnail_url, :slideshow, :small_url, :medium_url)
  end
end
