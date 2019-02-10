class PropertiesController < ApplicationController
  before_action :set_property, only: [:show, :edit, :update, :destroy, :add_mortgage_payments_to]
  before_action :authenticate_user!
  before_action :find_user

  # GET /properties
  # GET /properties.json
  def index
    @properties = @user.properties
  end

  # GET /properties/1
  # GET /properties/1.json
  def show
  end

  # GET /properties/new
  def new
    @property = Property.new
  end

  # GET /properties/1/edit
  def edit
  end

  # POST /properties
  # POST /properties.json
  def create
    @property = Property.new(property_params)
    @property.user_id = @user.id

    respond_to do |format|
      if @property.save
        format.html { redirect_to @property, notice: 'Property was successfully created.' }
        format.json { render :show, status: :created, location: @property }
      else
        format.html { render :new }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /properties/1
  # PATCH/PUT /properties/1.json
  def update
    respond_to do |format|
      if @property.update(property_params)
        format.html { redirect_to @property, notice: 'Property was successfully updated.' }
        format.json { render :show, status: :ok, location: @property }
      else
        format.html { render :edit }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /properties/1
  # DELETE /properties/1.json
  def destroy
    @property.destroy
    respond_to do |format|
      format.html { redirect_to properties_url, notice: 'Property was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def add_mortgage_payments_to
    date = Date.today
    @property.interest_payments.each do |key, value|
      if key < date
        @property.expenses.create(user_id: current_user.id, property_id: @property.id, amount:value, description:'Mortgage Interest Payment', date: key, expense_type: 1, category: 1)
      end
    end
    @property.principal_payments.each do |key, value|
      if key < date
        @property.expenses.create(user_id: current_user.id, property_id: @property.id, amount:value, description:'Mortgage Principal Payment', date: key, expense_type: 1, category: 1)
      end
    end
    redirect_to property_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property
      @property = Property.find(params[:id])
    end

    def property_params
      params.require(:property).permit(:address, :price, :mortgage_term, :mortgage_interest, :mortgage_principal, :mortgage_start_date)
    end

    def find_user
      @user = current_user
    end
end
