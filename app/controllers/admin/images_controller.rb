class Admin::ImagesController < Admin::BaseController
  before_filter :load_image, :only => [:show, :edit, :update, :destroy]

  def multi_change
    @images = Image.multi_update params[:images], params[:actions]
    redirect_to admin_images_url
  end

  def index
    @search = Image.search params[:search]
    @images = @search.paginate(paginate_options)
  end

  def show
  end

  def new
    @image = Image.new
  end

  def edit
  end

  def create
    @image = Image.new(params[:image])

    if @image.save
      flash[:notice] = _('Image was successfully created.')
      redirect_to(admin_image_url(@image))
    else
      render :action => "new"
    end
  end

  def update
    if @image.update_attributes(params[:image])
      flash[:notice] = _('Image was successfully updated.')
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
end
