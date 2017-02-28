class PortfoliosController < ApplicationController

  before_action :set_portfolio_item, only: [:show, :edit, :update]

  def index
    @portfolio_items = Portfolio.all
  end

  def show

  end

  def new
    @portfolio_item = Portfolio.new
  end

  # POST /portfolios
  # POST /portfolios.json
  def create
    @portfolio_item = Portfolio.new(portfolio_params)

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to @portfolio_item, notice: 'Portfolio_item was successfully created.' }
        format.json { render :show, status: :created, location: @portfolio_item }
      else
        format.html { render :new }
        format.json { render json: @portfolio_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /portfolios/:id/edit
  def edit
  end

  # PATCH/PUT /portfolios/:id
  def update
    respond_to do |format|
      if @portfolio_item.update(portfolio_params)
        format.html { redirect_to @portfolio_item, notice: 'Portfolio was successfully updated.' }
        format.json { render :show, status: :ok, location: @portfolio_item }
      else
        format.html { render :edit }
        format.json { render json: @portfolio_item.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_portfolio_item
      @portfolio_item = Portfolio.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def portfolio_params
      params.require(:portfolio).permit(:title, :subtitle, :body)
    end
end
