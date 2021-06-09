class GroupsController < ApplicationController

  def new
    @group = Group.new
    @group.users << current_user
  end

  def index
    @groups = Group.all
    @book = Book.new
    @user = @group.user
  end

  def create
    @group = Group.new(group_params)
    @group.owner = current_user  # グループを作成したユーザーがそのグループの管理者になる
  if @group.save
    redirect_to groups_path
  else
    render :new
  end
  end

  def update
    if @group.update(group_params)
      redirect_to groups_path
    else
      render :edit
    end
  end

  private
  def group_params
    params.require(:group).permit(:name, :introduction)
  end

end
