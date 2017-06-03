class PortfoliosController < ApplicationController

  layout 'portfolio'

  before_action :set_portfolio_item, only: [:show, :edit, :update, :destroy]

  # Authorization
  access all: [:show, :index],
         user: {except: [:toggle_status, :destroy, :new, :create, :edit, :update, :sort]},
         site_admin: :all

  def index
    @portfolio_items = Portfolio.by_position
  end

  def sort
    params[:order].each do |key, value|
      Portfolio.find(value[:id]).update(position: value[:position])
    end

    render nothing: true
  end

  def show

  end

  def new
    @portfolio_item = Portfolio.new
    3.times { @portfolio_item.technologies.build }
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
    3.times { @portfolio_item.technologies.build }
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

  def destroy
    @portfolio_item.destroy
    respond_to do |format|
      format.html { redirect_to portfolios_path, notice: 'Portfolio was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    def set_portfolio_item
      @portfolio_item = Portfolio.includes(:technologies).find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def portfolio_params
      params.require(:portfolio).permit(:title, :subtitle, :body, :technologies_attributes => [:name])
    end
end
