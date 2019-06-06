class FavoriteConvoysController < ApplicationController
  def create
    @convoy = Convoy.find(params[:convoy_id])
    @favorite_convoy = FavoriteConvoy.new(convoy_id: params[:convoy_id], user_id: current_user.id)
    authorize @favorite_convoy

    @favorite_convoy.save
    respond_to do |format|
      format.html { redirect_to convoys_path }
      format.js
    end
  end

  def destroy
    @favorite_convoy = FavoriteConvoy.find(params[:id])
    @convoy = @favorite_convoy.convoy

    authorize @favorite_convoy

    @favorite_convoy.delete

    respond_to do |format|
      format.html { redirect_to convoys_path }
      format.js { render :create }
    end
  end
end
