class PagesController < ApplicationController

  layout 'admin'

  def index
    @pages = Page.sorted
  end

  def show
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new({:name => 'Default'})
  end

  def create
    @page = Page.new(params.require(:page).permit(page_params))
    if @page.save
      flash[:notice] = 'Page created.'
      redirect_to(:action => 'index', :id => @page.id)
    else
      render('new')
    end
  end

  def edit
    @page = Page.find(params[:id])
  end

  def update
    @page = Page.find(params[:id])
    if @page.update_attributes(page_params)
      flash[:notice] = 'Page Updated'
      redirect_to(:action => 'show', :id => @page.id)
    else
      render('edit')
    end
  end


  def delete
    @page = Page.find(params[:id])
  end

  def destroy
    page = Page.find(params[:id])
    page.destroy
    flash[:notice] = "Page '#{page.name}' Deleted"
    redirect_to(:action => 'index')
  end


  private

  def page_params
    params.require(:page).permit(:name, :position, :visible, :permalink, :subject_id)
  end

end
