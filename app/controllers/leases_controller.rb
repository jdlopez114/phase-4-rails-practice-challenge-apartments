class LeasesController < ApplicationController

    def create 
        lease = Lease.create( lease_params )
        if lease.valid?
            render json: lease
        else 
            render json: { error:lease.errors.full_messages }, status: 422
        end
        
    end

    def destroy
        l = Lease.find( params[:id] )
        l.destroy 
        head :no_content 
    end

    private 

    def lease_params
        params.permit(:rent, :tenant_id, :apartment_id)
    end

end
