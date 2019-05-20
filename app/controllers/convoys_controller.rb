class ConvoysController < ApplicationController
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
    render action: 'show'
  end

  def destroy
  end

  def update
  end

  private

  def verify_locations(from, to)
    #TODO: first try to find locations in database, if not there, get it from MAP api
  end

  def convoy_params
    params.require(:convoy).permit(:name, :start_date, :finish_date, :fwd_only, :user_id, :completed)
  end
end
