class ConvoysController < ApplicationController
  before_action :set_convoy, only: %i[show update edit destroy]

  def index
    @convoys = policy_scope(Convoy).all
  end

  def show
  end

  def new
    @convoy = Convoy.new
    authorize @convoy
  end

  def create
     LocationService.new(params).create_location_hash

    @convoy = Convoy.new(convoy_params)

    if @convoy.save
      redirect_to convoy_path(@convoy)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @convoy.update(convoy_params)

    redirect_to convoy_path(@convoy)
  end

  def destroy
    @convoy.delete

    redirect_to convoys_path
  end

  private

  def set_convoy
    @convoy = Convoy.find(params[:id])
    authorize @convoy
  end

  def convoy_params
    params.require(:convoy).permit(:from_location_id, :to_location_id, :name, :start_date, :finish_date, :fwd_only, :user_id, :completed)
  end
end
