class ReviewsController < ApplicationController
  def create
    @convoy = Convoy.find(params[:convoy_id])
    @review = Review.new(review_params)
    authorize @review
    @review.convoy = @convoy

    if @review.save
      respond_to do |format|
        format.html { redirect_to convoy_path(@convoy) }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'convoys/show' }
        format.js
      end
    end
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
