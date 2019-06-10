class ConvoysController < ApplicationController
  before_action :set_convoy, only: %i[show update edit destroy]

  def index
    if params[:query].present?
      sql_query = "locations.name @@ :query \
        OR convoys.name @@ :query \
        OR users.name @@ :query \
      "
      @convoys = policy_scope(Convoy).joins(:user, :from_location, :to_location).where(sql_query, query: "%#{params[:query]}%")
    else
      @convoys = policy_scope(Convoy).all
    end
  end

  def show
    @member = Member.find_by(user_id: current_user.id, convoy_id: @convoy.id)
    @review = Review.new
    @able_to_join = @member ? false : true

    @geojson = build_geojson
  end

  def new
    @convoy = Convoy.new
    authorize @convoy
  end

  def create
    LocationService.new(params).create_location_hash
    @convoy = Convoy.new(convoy_params)
    authorize @convoy

    if @convoy.save
      redirect_to convoy_path(@convoy)
    else
      render :new
    end
  end

  def edit
    authorize @convoy
  end

  def update
    authorize @convoy
    @convoy.update(convoy_params)

    redirect_to convoy_path(@convoy)
  end

  def destroy
    authorize @convoy
    @convoy.delete

    redirect_to convoys_path
  end

  private

  def build_geojson
    {
      type: "FeatureCollection",
      features: @convoy.features
    }
  end

  def set_convoy
    @convoy = Convoy.find(params[:id])
    authorize @convoy
  end

  def convoy_params
    params.require(:convoy).permit(:from_location_id, :to_location_id, :name, :start_date, :finish_date,
                                   :fwd_only, :user_id, :completed, :photo)
  end
end
