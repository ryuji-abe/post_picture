class PicturesController < ApplicationController
  before_action :set_picture, only: [:show, :edit, :update, :destroy]
  before_action :require_login, only: [:new, :edit, :show]

  def new
    if params[:back]
      @picture = Picture.new(picture_params)
    else
      @picture = Picture.new
    end
  end

  def create
    @picture = Picture.create(picture_params)
    @picture.user_id = current_user.id
    @picture.image.retrieve_from_cache! params[:cache][:image]
    if @picture.save
      PictureMailer.picture_mail(@picture).deliver
      redirect_to pictures_path, notice: '投稿しました'
    else
      render 'new'
    end
  end

  def confirm
    @picture = Picture.new(picture_params)
    @picture.user_id = current_user.id
    render :new if @picture.invalid?
  end

  def show
    @picture = Picture.find(params[:id])
    @favorite = current_user.favorites.find_by(picture_id: @picture.id)
  end

  def edit
    @picture = Picture.find(params[:id])
  end

  def update
    @picture = Picture.find(params[:id])
    if @picture.update(picture_params)
      redirect_to pictures_path, notice: '投稿を更新しました'
    else
      render 'edit'
    end
  end

  def index
    @pictures = Picture.all
  end

  def destroy
    @picture.destroy
    redirect_to pictures_path, notice: '投稿を削除しました'
  end

  private
  def picture_params
    params.require(:picture).permit(:image, :content)
  end

  def set_picture
    @picture = Picture.find(params[:id])
  end

  def require_login
    unless logged_in?
      redirect_to new_session_path
    end
  end

end
