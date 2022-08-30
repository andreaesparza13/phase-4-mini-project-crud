class SpicesController < ApplicationController
   rescue_from ActiveRecord::RecordNotFound, with: :error_message

   def index 
      spices = Spice.all
      render json: spices
   end

   def create
      spice = Spice.create(spice_params)
      render json: spice, status: :created
   end

   def update
      spice = find_spice
      spice.update(spice_params)
      render json: spice
   end

   def destroy
      spice = find_spice
      spice.destroy
   end

   private

   def spice_params
      params.permit(:title, :description, :image, :notes, :rating)
   end

   def find_spice
      Spice.find(params[:id])
   end

   def error_message
      render json: { error: 'spice not found' }, status: :not_found
   end

end
