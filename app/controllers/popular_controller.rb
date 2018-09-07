class PopularController < ApplicationController
  def index
    @prototypes = Prototype.all.page(params[:page]).per(8).order('likes_count DESC')
  end
end
