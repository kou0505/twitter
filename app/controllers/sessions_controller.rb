class SessionsController < ApplicationController
  def new
  end
  def create
    email = params[:session][:email].downcase#取り出して大文字を小文字に
    password = params[:session][:password]
      if login(email, password)
        flash[:success] = 'ログインに成功しました。'
        redirect_to @user #usersshow
      else
        flash.now[:danger] = 'ログインに失敗しました。'
        render :new
      end
  end
  
  def destroy
    session[:user_id] = nil
    flash[:success] = 'ログアウトしました'
    redirect_to root_url
  end
  
  private

  def login(email, password)
    @user = User.find_by(email: email) #同じメールアドレスを検索
    if @user && @user.authenticate(password) #二つの組み合わせを確認
      # ログイン成功
      session[:user_id] = @user.id
      return true
    else
      # ログイン失敗
      return false
    end
  end
end
