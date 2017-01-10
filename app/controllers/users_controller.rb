class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  
  def new
    @user = User.new
  end

  def show
  end

  def see_tweets
    @tweets = current_user.tweets.order(created_at: :desc)
  end

  def see_follow_users
    # Pegar os usuário no qual o current_user é amigo mas eles não possuem o current_user no friend_id
  end

  def follow_user
    # Utilizar metodo para seguir usuário
  end

  def see_friends
    # Pegar os usuários que possuem o id do current_user no friend_id 
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'Legal was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @user.update(legal_params)
        format.html { redirect_to @user, notice: 'Legal was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  private
    
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:email, :username, :password, :password_confirmation)
    end

end
