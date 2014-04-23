class VerificationOrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_verification_order, only: [:show, :edit, :update, :destroy]

  # GET /verification_orders
  # GET /verification_orders.json
  def index
    @verification_orders = VerificationOrder.all
  end

  # GET /verification_orders/1
  # GET /verification_orders/1.json
  def show
  	
  end

  # GET /verification_orders/new
  def new
    @verification_order = VerificationOrder.new
  end

  # GET /verification_orders/1/edit
  def edit
  end

  # POST /verification_orders
  # POST /verification_orders.json
  def create
    @verification_order = VerificationOrder.new(verification_order_params)

    respond_to do |format|
      if @verification_order.save
        format.html { redirect_to @verification_order, notice: 'Verification order was successfully created.' }
        format.json { render action: 'show', status: :created, location: @verification_order }
      else
        format.html { render action: 'new' }
        format.json { render json: @verification_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /verification_orders/1
  # PATCH/PUT /verification_orders/1.json
  def update
    respond_to do |format|
      if @verification_order.update(verification_order_params)
        format.html { redirect_to @verification_order, notice: 'Verification order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @verification_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /verification_orders/1
  # DELETE /verification_orders/1.json
  def destroy
    @verification_order.destroy
    respond_to do |format|
      format.html { redirect_to verification_orders_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_verification_order
      @verification_order = VerificationOrder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def verification_order_params
      params[:verification_order][:status] = create_status
      params.require(:verification_order).permit(:users_id, :customers_id, :status)
    end
end
