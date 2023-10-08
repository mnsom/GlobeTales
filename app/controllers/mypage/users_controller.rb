class Mypage::UsersController < ApplicationController
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to mypage_user_path(@user), notice: "Post updated successfully"
    else
      puts @user.errors.full_messages
      render :show, status: :unprocessable_entity
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :location, :description, :avatar)
  end
end
