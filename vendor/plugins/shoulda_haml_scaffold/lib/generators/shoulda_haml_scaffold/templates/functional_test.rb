require 'test_helper'
 
class <%= controller_class_name %>ControllerTest < ActionController::TestCase
  def create_<%= file_name %> options={ }
    @<%= file_name %> = Factory.create_<%= file_name %> options
  end

  context 'GET to index' do
    setup do
      get :index
    end

    should_respond_with :success
    should_assign_to :<%= table_name %>
  end
 
  context 'GET to new' do
    setup do
      get :new
    end
 
    should_respond_with :success
    should_render_template :new
    should_assign_to :<%= file_name %>
  end
 
  context 'POST to create' do
    setup do
      post :create, :<%= file_name %> => Factory.<%= file_name %>
      @<%= file_name %> = <%= class_name %>.find(:all).last
    end
    
    should_redirect_to '<%= nested_part_name + file_name %>_path(@<%= file_name %>)' do
      <%= nested_part_name + file_name %>_path(@<%= file_name %>)
    end
  end

  context 'POST to create with error' do
    setup do
      <%= class_name %>.any_instance.stubs(:save).returns(false)
      post :create, :<%= file_name %> => Factory.<%= file_name %>
    end
    
    should_respond_with :success
    should_render_template :new
    should_assign_to :<%= file_name %>    
  end
 
  context 'GET to show' do
    setup do
      @<%= file_name %> = create_<%= file_name %>
      get :show, :id => @<%= file_name %>.id
    end

    should_respond_with :success
    should_render_template :show
    should_assign_to :<%= file_name %>
  end
 
  context 'GET to edit' do
    setup do
      @<%= file_name %> = create_<%= file_name %>
      get :edit, :id => @<%= file_name %>.id
    end

    should_respond_with :success
    should_render_template :edit
    should_assign_to :<%= file_name %>
  end
 
  context 'PUT to update' do
    setup do
      @<%= file_name %> = create_<%= file_name %>
      put :update, :id => @<%= file_name %>.id, :<%= file_name %> => { }
    end

    should_redirect_to '<%= nested_part_name + file_name %>_path(@<%= file_name %>)' do
      <%= nested_part_name + file_name %>_path(@<%= file_name %>)
    end
  end

  context 'PUT to update with error' do
    setup do
      <%= class_name %>.any_instance.stubs(:update_attributes).returns(false)
      put :update, :id => create_<%= file_name %>.id, :<%= file_name %> => { }
    end

    should_respond_with :success
    should_render_template :edit
    should_assign_to :<%= file_name %>
  end
 
  context 'DELETE to destroy' do
    setup do
      @<%= file_name %> = create_<%= file_name %>
      delete :destroy, :id => @<%= file_name %>.id
    end

    should_redirect_to '<%= nested_part_name + table_name %>_path' do
      <%= nested_part_name + table_name %>_path
    end
  end
end
