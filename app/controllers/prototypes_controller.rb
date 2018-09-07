class PrototypesController < ApplicationController
  before_action :set_prototype, only: [:show, :edit]

  def index
    @prototypes = Prototype.all.page(params[:page]).per(8)
  end

  def new
    @prototype = Prototype.new
    @prototype.captured_images.build
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to :root, notice: 'New prototype was successfully created'
    else
      redirect_to ({ action: new }), alert: 'YNew prototype was unsuccessfully created'
     end
  end

  def edit
    @prototype = Prototype.find(params[:id])
  end

  def update
    prototype = Prototype.find(params[:id])
    if current_user.id == prototype.user_id
      prototype.update(prototype_params)
    end
  end

  def show
    @prototype = Prototype.find(params[:id])
    @comments = @prototype.comments.includes(:user)
  end

  def destroy
    prototype = Prototype.find(params[:id])
    if current_user.id == prototype.user_id
      prototype.destroy
    end
  end

  private

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end

  def prototype_params
    params.require(:prototype).permit(
      :title,
      :catch_copy,
      :concept,
      :user_id,
      captured_images_attributes: [:content, :status]
    )
  end
end
