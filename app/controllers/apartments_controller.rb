class ApartmentsController < ApplicationController

    def index
        apartments = Apartment.all 
        render json: apartments, status: 200 
    end

    def show
        apartment = Apartment.find( params[:id] )
        render json: apartment, status: 302
    end

    def create 
        apartment = Apartment.create( apartment_params )
        render json: apartment
    end

    def update
        a = Apartment.find( params[:id] )
        a.update!( apartment_params )
        render json: a, status: :ok
    end

    def destroy
        a = Apartment.find( params[:id] )
        a.destroy 
        head :no_content 
    end

    private 

    def apartment_params
        params.permit(:number)
    end

end
