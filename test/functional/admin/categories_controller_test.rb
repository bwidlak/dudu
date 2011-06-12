require 'test_helper'
 
class Admin::CategoriesControllerTest < ActionController::TestCase
  def create_category options={ }
    @category = Category.create!({:name => 'category'}.merge(options))
  end

  context "Admin" do
    setup {
      @request.session[:logged_in] = true
    }
    context 'GET to index' do
      setup do
        get :index
      end

      should_respond_with :success
      should_assign_to :categories
    end
 
    context 'GET to new' do
      setup do
        get :new
      end
 
      should_respond_with :success
      should_render_template :new
      should_assign_to :category
    end
 
    context 'POST to create' do
      setup do
        post :create, :category => {}
        @category = Category.find(:all).last
      end
    
      should_redirect_to 'admin_category_path(@category)' do
        admin_category_path(@category)
      end
    end

    context 'POST to create with error' do
      setup do
        Category.any_instance.stubs(:save).returns(false)
        post :create, :category => {}
      end
    
      should_respond_with :success
      should_render_template :new
      should_assign_to :category    
    end
 
    context 'GET to show' do
      setup do
        @category = create_category
        get :show, :id => @category.id
      end

      should_respond_with :success
      should_render_template :show
      should_assign_to :category
    end
 
    context 'GET to edit' do
      setup do
        @category = create_category
        get :edit, :id => @category.id
      end

      should_respond_with :success
      should_render_template :edit
      should_assign_to :category
    end
 
    context 'PUT to update' do
      setup do
        @category = create_category
        put :update, :id => @category.id, :category => { }
      end

      should_redirect_to 'admin_category_path(@category)' do
        admin_category_path(@category)
      end
    end

    context 'PUT to update with error' do
      setup do
        Category.any_instance.stubs(:update_attributes).returns(false)
        put :update, :id => create_category.id, :category => { }
      end

      should_respond_with :success
      should_render_template :edit
      should_assign_to :category
    end
 
    context 'DELETE to destroy' do
      setup do
        @category = create_category
        delete :destroy, :id => @category.id
      end

      should_redirect_to 'admin_categories_path' do
        admin_categories_path
      end
    end
  end
end
