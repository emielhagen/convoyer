class MembersController < ApplicationController
  def create
    @convoy = Convoy.find(params[:convoy_id])
    @member = Member.new(user_id: current_user.id, convoy_id: @convoy.id)
    authorize @member

    if @member.save
      respond_to do |format|
        format.html { redirect_to convoy_path(@convoy) }
        format.js  # <-- will render `app/views/members/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'convoys/show' }
        format.js
      end
    end
    # redirect_to convoy_path(@convoy)
  end

  def destroy
    @convoy = Convoy.find(params[:id])
    member = Member.find_by(user_id: current_user.id, convoy_id: @convoy.id)
    authorize member
    member.destroy

    redirect_to convoy_path(@convoy)
  end
end
