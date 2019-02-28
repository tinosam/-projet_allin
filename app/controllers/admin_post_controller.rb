class AdminPostController < ApplicationController

  def confirm_post
    puts "################################"
    puts params
    puts "###################################"
    @post = Post.find(params[:id])
    @post.confirmed = 1
    @post.save
    redirect_to dashboard_path
  end

  def to_confirm_post
    puts "################################"
    puts params
    puts "###################################"
  end
end
