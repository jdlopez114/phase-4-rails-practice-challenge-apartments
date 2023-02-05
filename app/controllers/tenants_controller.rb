class TenantsController < ApplicationController

    def index
        tenants = Tenant.all 
        render json: tenants, status: 200 
    end

    def show
        tenant = Tenant.find( params[:id] )
        render json: tenant, status: 302
    end

    def create 
        tenant = Tenant.create( tenant_params )
        render json: tenant
    end

    def update
        t = Tenant.find( params[:id] )
        t.update!( tenant_params )
        render json: t, status: :ok
    end

    def destroy
        t = Tenant.find( params[:id] )
        t.destroy 
        head :no_content 
    end

    private 

    def tenant_params
        params.permit(:name, :age)
    end

end
