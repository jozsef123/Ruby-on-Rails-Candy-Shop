class CandiesController < ApplicationController
  before_action :set_candy, only: %i[ show edit update destroy ]

  # GET /candies or /candies.json
  def index
    @candies = Candy.all
  end

  # GET /candies/1 or /candies/1.json
  def show
  end

  # GET /candies/new
  def new
    @candy = Candy.new
    @shelves = Shelf.where(status: false)
  end

  # GET /candies/1/edit
  def edit
    @candy = Candy.find(params[:id])
    @tempShopId = @candy.shelf.shop.id
    @status = @candy.status
    @shelfId = Shelf.where(status: false, shop_id: @tempShopId).first&.id
    @shelves = Shelf.where(status: true, shop_id: @tempShopId).pluck(:id)
    @shelfCount = @candy.shelf.shop.shelves.count - 1
  end

  # POST /candies or /candies.json
  def create

    @candy = Candy.new(candy_params)
    @candy.status = false

    respond_to do |format|
      if @candy.save
        format.html { redirect_to candy_url(@candy), notice: "Candy was successfully created." }
        format.json { render :show, status: :created, location: @candy }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @candy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /candies/1 or /candies/1.json
  def update
    if @candy.status == false
        @candy.status = true
    else
        @candy.status = false
    end
    respond_to do |format|
      if @candy.update(candy_params)
        format.html { redirect_to candy_url(@candy), notice: "Candy was successfully updated." }
        format.json { render :show, status: :ok, location: @candy }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @candy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /candies/1 or /candies/1.json
  def destroy
    @candy.destroy

    respond_to do |format|
      format.html { redirect_to candies_url, notice: "Candy was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_candy
      @candy = Candy.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def candy_params
      params.require(:candy).permit(:name, :status, :shelf_id)
    end
end
