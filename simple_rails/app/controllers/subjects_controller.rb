class SubjectsController < ApplicationController

  layout 'admin'

  def index
    @subjects = Subject.sorted
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new({:name => 'Default'})
  end

  def create
    @subject = Subject.new(params.require(:subject).permit(:name, :position, :visible))
    if @subject.save
      flash[:notice] = 'Subject created.'
      redirect_to(:action => 'index', :id => @subject.id)
    else
      render('new')
    end
  end

  def edit
    @subject = Subject.find(params[:id])
  end

  def update
    @subject = Subject.find(params[:id])
    if @subject.update_attributes(sub_params)
      flash[:notice] = 'Subject Updated'
      redirect_to(:action => 'show', :id => @subject.id)
    else
      render('edit')
    end
  end


  def delete
    @subject = Subject.find(params[:id])
  end

  def destroy
    subject = Subject.find(params[:id])
    subject.destroy
    flash[:notice] = "Subject '#{subject.name}' Deleted"
    redirect_to(:action => 'index')
  end


  private

  def sub_params
    params.require(:subject).permit(:name, :position, :visible)
  end

end
