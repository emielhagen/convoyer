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
    @convoy = Convoy.new(convoy_params)
    @convoy.save!

    render action: 'index'
  end

  def destroy
  end

  def update
  end

  private

  def convoy_params
    params.require(:convoy).permit(:name, :start_date, :finish_date, :fwd_only, :user_id, :completed)
  end
end
