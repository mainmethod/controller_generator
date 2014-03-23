class <%= class_name.pluralize %>Controller < ApplicationController

  def index
    @<%= plural_name %> = <%= class_name %>.all
  end
  
  def new
    @<%= plural_name.singularize %> = <%= class_name %>.new
  end
  
  def create
    @<%= plural_name.singularize %> = <%= class_name %>.new(<%= plural_name.singularize %>_params)
    if @<%= plural_name.singularize %>.save
      flash[:notice] = "<%= class_name %> saved successfully"
      redirect_to @<%= plural_name.singularize %>
    else
      flash.now[:error] = @<%= plural_name.singularize %>.errors.full_messages.to_sentence
      render :new
    end
  end
  
  def edit
    @<%= plural_name.singularize %> = <%= class_name %>.find(params[:id])
  end
  
  def update
    @<%= plural_name.singularize %> = <%= class_name %>.find(params[:id])
    if @<%= plural_name.singularize %>.update(<%= plural_name.singularize %>_params)
      flash[:notice] = "<%= class_name %> saved successfully"
      redirect_to @<%= plural_name.singularize %>
    else
      flash.now[:error] = @<%= plural_name.singularize %>.errors.full_messages.to_sentence
      render :edit
    end
  end
  
  def show
    @<%= plural_name.singularize %> = <%= class_name %>.find(params[:id])
  end
  
  def destroy
    @<%= plural_name.singularize %> = <%= class_name %>.find(params[:id])
    @<%= plural_name.singularize %>.destroy
    redirect_to <%= plural_name %>_path
  end
  
  private
  
  def <%= plural_name.singularize %>_params
    params.require(:<%= plural_name.singularize %>).permit!
  end
end