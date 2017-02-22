class TweetsController < ApplicationController
before_action :authenticate_user!, except: [:index]

  #display all users on index page "/"
  def index
    @users = User.all.to_a
  end

  #displays all tweets on show page route "localhost:3000/'username'"
  def show
    @user = User.find_by!(username: params[:username])
    #This saves user tweets in desc order.
    @tweets = @user.tweets.order(created_at: :desc)
  end

  #Allows user to create new tweet
  def new
    @user = current_user
    @tweet = @user.tweets.new
  end

  #Allows user to save new tweet
  def create
    @user = current_user
    # .create is used to create article using its parameter which are defined as article_params (see below)
    @tweet = @user.tweets.new(tweets_params)
    if @tweet.save
      # Redirecting to the main page when article is created so user can see it.
      flash[:success] = "Successfully created new Tweet"
      redirect_to action: :show
    else
      flash[:error] = @tweet.errors.full_messages.join(',')
      render action: :new
    end
  end

  def tweets_params
    # the parameters for new article creation #strong params
    params.require(:tweet).permit(:content)
  end


end
