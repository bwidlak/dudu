require 'test_helper'
 
class Admin::ImagesControllerTest < ActionController::TestCase
  def create_image options={ }
    @image = Image.create!({:title => 'title'}.merge(options))
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
      should_assign_to :images
    end
 
    context 'GET to new' do
      setup do
        get :new
      end
 
      should_respond_with :success
      should_render_template :new
      should_assign_to :image
    end
 
    context 'POST to create' do
      setup do
        post :create, :image => {}
        @image = Image.find(:all).last
      end
    
      should_redirect_to 'admin_image_path(@image)' do
        admin_image_path(@image)
      end
    end

    context 'POST to create with error' do
      setup do
        Image.any_instance.stubs(:save).returns(false)
        post :create, :image => {}
      end
    
      should_respond_with :success
      should_render_template :new
      should_assign_to :image    
    end
 
    context 'GET to show' do
      setup do
        @image = create_image
        get :show, :id => @image.id
      end

      should_respond_with :success
      should_render_template :show
      should_assign_to :image
    end
 
    context 'GET to edit' do
      setup do
        @image = create_image
        get :edit, :id => @image.id
      end

      should_respond_with :success
      should_render_template :edit
      should_assign_to :image
    end
 
    context 'PUT to update' do
      setup do
        @image = create_image
        put :update, :id => @image.id, :image => { }
      end

      should_redirect_to 'admin_image_path(@image)' do
        admin_image_path(@image)
      end
    end

    context 'PUT to update with error' do
      setup do
        Image.any_instance.stubs(:update_attributes).returns(false)
        put :update, :id => create_image.id, :image => { }
      end

      should_respond_with :success
      should_render_template :edit
      should_assign_to :image
    end
 
    context 'DELETE to destroy' do
      setup do
        @image = create_image
        delete :destroy, :id => @image.id
      end

      should_redirect_to 'admin_images_path' do
        admin_images_path
      end
    end
  end
end
