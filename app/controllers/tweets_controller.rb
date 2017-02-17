class TweetsController < ApplicationController
before_action :authenticate_user!, except: [:index]

  #display all users on index page "/"
  def index
    @users = User.all.to_a
  end

  #displays all tweets on show page route "localhost:3000/'username'"
  def show
    @tweets = Tweet.all.to_a
  end

  #Allows user to create new tweet
  def new
  end

  #Allows user to save new tweet
  def create
  end

  def after_sign_in_path_for(resource)
  username_path(current_user) #your path
  end


end
