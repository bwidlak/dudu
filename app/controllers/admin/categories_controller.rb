class Admin::CategoriesController < Admin::BaseController
  before_filter :load_category, :only => [:show, :edit, :update, :destroy]

  def index
    @categories = Category.find(:all)
  end

  def show
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def create
    @category = Category.new(params[:category])

    if @category.save
      flash[:notice] = _('Category was successfully created.')
      redirect_to(admin_category_url(@category))
    else
      render :action => "new"
    end
  end

  def update
    if @category.update_attributes(params[:category])
      flash[:notice] = _('Category was successfully updated.')
      redirect_to(admin_category_url(@category))
    else
      render :action => "edit"
    end
  end

  def destroy
    unless @category.images.empty?
      flash[:error] = _('Nie można usunąć kategorii, bo sa w niej zdjecia!')
      return redirect_to(admin_categories_url)
    end
    @category.destroy
    redirect_to(admin_categories_url)
  end

private

  def load_category
    @category = Category.find(params[:id])
  end
end
