class NewController < ApplicationController

layout false

  def head
  	@id = params[:id].to_i
  	@pageno = params[:page].to_i
  	render(:template => 'new/head')
  end

  def hello
  	@array = ["1","2","3"]
  	@id = params[:id].to_i
  	@pageno = params[:page].to_i
  	render('hello')
  end

  def hello_two
  	render('head')
  end

  def something
  	redirect_to(:controller => 'new', :action => 'hello_two')
  end

  def something_two
  	redirect_to(:action => 'hello')
  end

  def google
  	redirect_to("http://google.com")
  end

end
