# frozen_string_literal: true

# CreateFoodReviewController Template
class StoreCustomer::CreateFoodReviewController < StoreCustomer::StoreCustomerController
  def create
    food_id = create_food_review_params[:food_review_info][:food_id]
    review = create_food_review_params[:food_review_info][:text_body]

    food_review_info = current_store_customer
                       .create_food_review(
                         food_review_info: {
                           text_body: review,
                           food_id:
                         }
                       )

    render json: food_review_info
  rescue ActionController::ParameterMissing => e
    render json: {
      status: 400,
      message: 'invalid parameters',
      errors: e.message
    }
  end

  private

  def create_food_review_params
    params
      .require(:create_food_review_info)
      .permit(
        { food_review_info: %i[text_body food_id] }
      )
  end
end
