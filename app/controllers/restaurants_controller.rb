class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all # This fetches all restaurant records
  end

  def new
    @restaurant = Restaurant.new
    @review = @restaurant.reviews.new
  end

  def create
    # Create a new restaurant with the parameters from the form
    @restaurant = Restaurant.new(restaurant_params)
    # Try to save the restaurant to the database
    if @restaurant.save
      # If successful, redirect to the restaurant's show page with a success message
      redirect_to @restaurant, notice: 'Restaurant was successfully created.'
    else
      # If there's an error (e.g., validation fails), render the 'new' form again
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @review = @restaurant.reviews.new
  end

  private

  # Strong params to allow only specific attributes to be used in the form submission
  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :category)
  end
end
