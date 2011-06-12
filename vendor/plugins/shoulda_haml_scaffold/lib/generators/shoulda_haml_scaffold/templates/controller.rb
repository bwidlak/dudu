class <%= controller_class_name %>Controller < ApplicationController
  before_filter :load_<%= file_name %>, :only => [:show, :edit, :update, :destroy]

  def index
    @<%= table_name %> = <%= class_name %>.find(:all)
  end

  def show
  end

  def new
    @<%= file_name %> = <%= class_name %>.new
  end

  def edit
  end

  def create
    @<%= file_name %> = <%= class_name %>.new(params[:<%= file_name %>])

    if @<%= file_name %>.save
      flash[:notice] = _('<%= class_name %> was successfully created.')
      redirect_to(<%= nested_part_name + file_name %>_url(@<%= file_name %>))
    else
      render :action => "new"
    end
  end

  def update
    if @<%= file_name %>.update_attributes(params[:<%= file_name %>])
      flash[:notice] = _('<%= class_name %> was successfully updated.')
      redirect_to(<%= nested_part_name + file_name %>_url(@<%= file_name %>))
    else
      render :action => "edit"
    end
  end

  def destroy
    @<%= file_name %>.destroy
    redirect_to(<%= nested_part_name + table_name %>_url)
  end

private

  def load_<%= file_name %>
    @<%= file_name %> = <%= class_name %>.find(params[:id])
  end
end
