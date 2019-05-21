class ConvoysController < ApplicationController
  before_action :set_convoy, only: %i[show update edit destroy]

  def index
    @convoys = Convoy.all
  end

  def show
  end

  def new
    @convoy = Convoy.new
  end

  def create
    verify_locations(params[:from_location], params[:to_location])

    @convoy = Convoy.new(convoy_params)
    @convoy.save!

    @convoys = Convoy.all

    redirect_to convoys_path
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
  end

  def verify_locations(from, to)
    #TODO: first try to find locations in database, if not there, get it from MAP api
  end

  def convoy_params
    params.require(:convoy).permit(:name, :start_date, :finish_date, :fwd_only, :user_id, :completed)
  end
end
