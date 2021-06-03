class UsersController < ApplicationController

  def show
    the_username = params.fetch("the_username")

    @user = User.where({ :username => the_username }).at(0)
    
    render({ :template => "users/show.html.erb" })
  end

  def feed
    
    the_username = params.fetch("the_username")

    @user = User.where({ :username => the_username }).at(0)
    
    render({ :template => "users/feed.html.erb" })
  end

end