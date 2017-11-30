class AdminController < ApplicationController
  before_action :must_admin_login, only: [:index]
  def login
  end
  def signin
    admin = Admin.find_by(username: params[:username])
  		if admin && admin.authenticate(params[:password])
        session[:admin_id] = admin.id
        redirect_to admin_index_path      
  		else
        flash.now[:danger] = "Username atau Password salah!"
        render 'login'
  		end
  end
  def logout
    session[:admin_id] = nil
    redirect_to admin_path
  end
  def index
      @kontak = Kontak.all
  end
end