class SectionsController < ApplicationController

  layout 'admin'

  def index
    @sections = Section.sorted
  end

  def show
    @section = Section.find(params[:id])
  end

  def new
    @section = Section.new({:name => 'Default'})
  end

  def create
    @section = Section.new(params.require(:section).permit(sec_params))
    if @section.save
      flash[:notice] = 'Section created.'
      redirect_to(:action => 'index', :id => @section.id)
    else
      render('new')
    end
  end

  def edit
    @section = Section.find(params[:id])
  end

  def update
    @section = Section.find(params[:id])
    if @section.update_attributes(sec_params)
      flash[:notice] = 'Section Updated'
      redirect_to(:action => 'show', :id => @section.id)
    else
      render('edit')
    end
  end


  def delete
    @section = Section.find(params[:id])
  end

  def destroy
    section = Section.find(params[:id])
    section.destroy
    flash[:notice] = "Section '#{section.name}' Deleted"
    redirect_to(:action => 'index')
  end


  private

  def sec_params
    params.require(:section).permit(:name, :position, :visible, :content_type, :content, :page_id)
  end
end
