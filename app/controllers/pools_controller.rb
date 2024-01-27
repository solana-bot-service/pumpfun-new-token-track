class PoolsController < ApplicationController
  before_action :set_pool, only: %i[ show update destroy ]

  # GET /pools
  def index
    @pools = Pool.all

    render json: @pools
  end

  # GET /pools/1
  def show
    render json: @pool
  end

  # POST /pools
  def create
    ParseWebhookJob.perform_now(params)
  end

  # PATCH/PUT /pools/1
  def update
    if @pool.update(pool_params)
      render json: @pool
    else
      render json: @pool.errors, status: :unprocessable_entity
    end
  end

  # DELETE /pools/1
  def destroy
    @pool.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pool
      @pool = Pool.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pool_params
      params.require(:pool).permit(:address, :name, :liquidity, :protocol_id)
    end
end
