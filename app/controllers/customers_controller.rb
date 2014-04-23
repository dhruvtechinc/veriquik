class CustomersController < ApplicationController
  before_filter :restrict_access
  #before_filter :json_client_key_validation
  before_action :authenticate_user!
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  respond_to :html, :json
  # GET /customers
  # GET /customers.json
  def index
    @customers = Customer.all
    respond_with @customers
  end

  # GET /customers/1
  # GET /customers/1.json
  def show
    @customer = Customer.find(params[:id])
    respond_with @customer
  end

  # GET /customers/new
  def new
    @customer = Customer.new
  end

  # GET /customers/1/edit
  def edit
  end

  # POST /customers
  # POST /customers.json
  def create
    @customer = Customer.new(customer_params)
    @customer.save
    respond_with @customer
  end

  # PATCH/PUT /customers/1
  # PATCH/PUT /customers/1.json
  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    respond_with @customer
  end

  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
    respond_with @customer
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_params
      params.require(:customer).permit(:first_name, :last_name, :middle_name, :ssn, :address, :city, :zip, :drivers_license_image, :current_image)
    end

    def restrict_access
        if params[:format] == 'json'
        authenticate_or_request_with_http_token do |token, options|
        ApiKey.exists?(api_key: token)
      end
      end
    end
end
