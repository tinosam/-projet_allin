class AdminController < ApplicationController
  before_action :initialize_admin
  def login
  end

  def logout
    session.delete(:admin_post)
    redirect_to login_admin_path
  end

  def auth
    password = Digest::SHA2.hexdigest params[:password]
    if(@admin.password == password)
      session[:admin_post] = @admin.id
      redirect_to dashboard_path
    else
      redirect_to login_admin_path
    end
  end

  def dashboard
    @posts = Post.where(confirmed: nil)
    puts "########################"
    puts session[:admin_post]
    puts "########################"
    if(session[:admin_post])
      if(session[:admin_post] < 0)
        redirect_to login_admin_path
      end
    else
      redirect_to login_admin_path
    end

  end

  private
  def initialize_admin
    @admin = Admin.first
    if !@admin
      @admin = Admin.new
      @admin.password = Digest::SHA2.hexdigest "secret"
      @admin.save
    end
  end
end
