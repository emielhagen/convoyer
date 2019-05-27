class MembersController < ApplicationController
  def create
    @convoy = Convoy.find(params[:convoy_id])
    @member = Member.create(user_id: current_user.id, convoy_id: @convoy.id )
    authorize @member

    redirect_to convoy_path(@convoy)
  end

  def destroy
    @convoy = Convoy.find(params[:id])
    member = Member.find_by(user_id: current_user.id, convoy_id: @convoy.id )
    authorize member
    member.destroy

    redirect_to convoy_path(@convoy)
  end
end
