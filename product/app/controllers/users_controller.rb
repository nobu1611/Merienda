class UsersController < ApplicationController
  # ログインしていない場合はログイン画面にリダイレクト
  # before_action :authenticate_user!, only: [:index, :show, :edit, :update, :destroy]

  # # すべてのユーザーを取得
  # def index
  #   @users = User.all
  # end

  # # 新規ユーザー作成のフォーム
  # def new
  #   @user = User.new
  # end

  # # 新規ユーザーを作成
  # def create
  #   @user = User.new(user_params)
  #   if @user.save
  #     # 成功した場合の処理
  #     redirect_to @user
  #   else
  #     # 失敗した場合の処理
  #     render 'new'
  #   end
  # end

  # # ユーザー詳細を取得
  # def show
  #   @user = User.find(params[:id])
  # end

  # # ユーザー情報更新のフォーム
  # def edit
  #   @user = User.find(params[:id])
  # end

  # # ユーザー情報を更新
  # def update
  #   @user = User.find(params[:id])
  #   if @user.update(user_params)
  #     # 成功した場合の処理
  #     redirect_to @user
  #   else
  #     # 失敗した場合の処理
  #     render 'edit'
  #   end
  # end

  # # ユーザーを削除
  # def destroy
  #   @user = User.find(params[:id])
  #   @user.destroy
  #   redirect_to users_path
  # end

  # private
  #   def user_params
  #     params.require(:user).permit(:username, :password)
  #   end
end
