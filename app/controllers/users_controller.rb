class UsersController < ApplicationController
  wrap_parameters :user, include: [:email, :password]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
    render layout: false
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
	block_prepare(@user,["user_id": @user.id,"registration": true])
    end
    redirect_to root_path
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
   
  def messages
    if logged_in? then
        @messages = Question.where(user_id: current_user.id)
	@users = User.where(approved:false)
	@hospitals = Hospital.where(approved:false)
	@equipments = Equipment.where(approved:false)
    else
	redirect_to root_path
    end
  end

  def approve
	@message = Question.find_by(id: params[:id])
    if logged_in? then
	if @message.object == "User" then
		@user = User.find_by(id: @message.id_object)
		@block = nextBlock(@user)
	elsif @message.object == "Hospital" then
		@hospital = Hospital.find_by(id: @message.id_object)
		@block = nextBlock(@hospital)
	elsif @message.object == "Equipment" then
		@equipment = Equipment.find_by(id: @message.id_object)
		@block = nextBlock(@equipment)
	end
	if not @block.nil? then 
	    if @block.index == 4 then
		@messages = Question.where(object: @message.object,id_object: @message.id_object)
		@messages.each do |message|
			message.destroy
		end
	    else
		@message.destroy
	    end
	end
	redirect_to messages_path
    else
	redirect_to root_path
    end
  end
 
  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:email, :password, :role, :hospital_id)
    end
end
