class UsersController < ApplicationController

  def edit
    @user = User.find(current_user.id)
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path,notice:"ユーザー情報の変更を保存しました"
    else
      render :edit,flash.now[:alert] = "変更は保存できていません、、。"
    end
  end

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
