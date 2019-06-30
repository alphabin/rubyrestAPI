class UsersController < ApplicationController

  def signin
    # display form to allow user to type their name
  end 
  
  def visit
    # user name is entered
    user_name = params[:name]
    user_name.downcase! 
    @user = User.find_by(name: user_name)
    @user = User.new(name: user_name, visits: 0)  if @user.nil?
    @user.visits+=1
    @user.save
  end
  
  def goodbye
    user_id = params[:id]
    @user = User.find(user_id)
  end
end