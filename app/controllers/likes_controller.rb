class LikesController < ApplicationController
    before_action :set_variables

  def like
    like = current_user.likes.new(prototype_id: @prototype.id)
    like.save
    @likes = Like.where(prototype_id: params[:prototype_id])
    @prototypes = Prototype.all
  end

  def unlike
    like = current_user.likes.find_by(prototype_id: @prototype.id)
    like.destroy
    @likes = Like.where(prototype_id: params[:prototype_id])
    @prototypes = Prototype.all
  end

  private

  def set_variables
    @prototype = Prototype.find(params[:prototype_id])
    @id_name = "#like-link-#{@prototype.id}"
    @id_heart = "#heart-#{@prototype.id}"
  end

end
