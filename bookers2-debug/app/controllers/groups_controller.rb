class GroupsController < ApplicationController

  def new
    @group = Group.new
    @group.users << current_user
  end

  def index
    @groups = Group.all
    @book = Book.new
  end

  def create
    @group = Group.new(group_params)
    @group.user_id = current_user.id
  if @group.save
    redirect_to groups_path
  else
    render :new
  end
  end

  def show
    @booknew = Book.new
    @group = Group.find(params[:id])
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to groups_path
    else
      render :edit
    end
  end

  private
  def group_params
    params.require(:group).permit(:name, :introduction, :group_image, { :user_ids => [] })
  end

end
