class GroupsController < ApplicationController

  def index
    groups = Group.where(user_id: params[:user_id])
    render json: groups
  end

  def show
    group = Group.find(params[:id])
    render json: group.contacts
  end

end
