class NewestController < ApplicationController

  def index
    @prototypes = Prototype.all.page(params[:page]).per(8).order('created_at DESC')
  end
end
