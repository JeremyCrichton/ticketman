class TagsController < ApplicationController
  before_action :set_tag, only: [:edit, :update, :destroy]
  before_action :require_user, except: [:show, :index]

  def index
    @tags = Tag.all.order(:name)
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(name: params[:tag][:name])
    
    if @tag.save
      redirect_to tags_path, notice: "The tag was created."
    else
      render :new
    end
  end

  def edit
    
  end

  def update
    if @tag.update(name: params[:tag][:name])
      redirect_to tags_path, notice: "The tag was updated."
    else
      render :edit
    end
  end

  def destroy
    @tag.destroy
    redirect_to tags_path
  end

  private

  def set_tag
    @tag = Tag.find(params[:id])
  end
end