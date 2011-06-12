require 'test_helper'
 
class Admin::CommentsControllerTest < ActionController::TestCase
  def create_comment options={ }
    @comment = Comment.create!({:body => 'body', :author => 'author'}.merge(options))
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
      should_assign_to :comments
    end
 
    context 'GET to new' do
      setup do
        get :new
      end
 
      should_respond_with :success
      should_render_template :new
      should_assign_to :comment
    end
 
    context 'POST to create' do
      setup do
        post :create, :comment => {}
        @comment = Comment.find(:all).last
      end
    
      should_redirect_to 'admin_comment_path(@comment)' do
        admin_comment_path(@comment)
      end
    end

    context 'POST to create with error' do
      setup do
        Comment.any_instance.stubs(:save).returns(false)
        post :create, :comment => {}
      end
    
      should_respond_with :success
      should_render_template :new
      should_assign_to :comment    
    end
 
    context 'GET to show' do
      setup do
        @comment = create_comment
        get :show, :id => @comment.id
      end

      should_respond_with :success
      should_render_template :show
      should_assign_to :comment
    end
 
    context 'GET to edit' do
      setup do
        @comment = create_comment
        get :edit, :id => @comment.id
      end

      should_respond_with :success
      should_render_template :edit
      should_assign_to :comment
    end
 
    context 'PUT to update' do
      setup do
        @comment = create_comment
        put :update, :id => @comment.id, :comment => { }
      end

      should_redirect_to 'admin_comment_path(@comment)' do
        admin_comment_path(@comment)
      end
    end

    context 'PUT to update with error' do
      setup do
        Comment.any_instance.stubs(:update_attributes).returns(false)
        put :update, :id => create_comment.id, :comment => { }
      end

      should_respond_with :success
      should_render_template :edit
      should_assign_to :comment
    end
 
    context 'DELETE to destroy' do
      setup do
        @comment = create_comment
        delete :destroy, :id => @comment.id
      end

      should_redirect_to 'admin_comments_path' do
        admin_comments_path
      end
    end
  end
end
