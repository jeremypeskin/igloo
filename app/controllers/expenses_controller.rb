class ExpensesController < ApplicationController
  before_action :set_expense, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :find_user

  # GET /expenses
  # GET /expenses.json
  def index
    @expenses = @user.expenses.order(date: :desc)
    @sum_of_expenses = @user.expenses.sum(:amount)
  end

  # GET /expenses/1
  # GET /expenses/1.json
  def show
  end

  # GET /expenses/new
  def new
    @expense = Expense.new
    @units = @user.units
    @properties = @user.properties
  end

  # GET /expenses/1/edit
  def edit
    @units = @user.units
    @properties = @user.properties
  end

  # POST /expenses
  # POST /expenses.json
  def create
    @expense = Expense.new(expense_params)
    @expense.user_id = @user.id
    set_property_id(@expense)

    respond_to do |format|
      if @expense.save
        format.html { redirect_to @expense, notice: 'Expense was successfully created.' }
        format.json { render :show, status: :created, location: @expense }
      else
        format.html { render :new }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /expenses/1
  # PATCH/PUT /expenses/1.json
  def update

    respond_to do |format|
      if @expense.update(expense_params)
        set_property_id(@expense)
        format.html { redirect_to @expense, notice: 'Expense was successfully updated.' }
        format.json { render :show, status: :ok, location: @expense }
      else
        format.html { render :edit }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /expenses/1
  # DELETE /expenses/1.json
  def destroy
    @expense.destroy
    respond_to do |format|
      format.html { redirect_to expenses_url, notice: 'Expense was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_expense
      @expense = Expense.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def expense_params
      params.require(:expense).permit(:amount, :description, :date, :unit_id, :property_id, :expense_type, :category)
    end

    def find_user
      @user = current_user
    end

    def set_property_id(expense)
      property_id = expense.property_id.presence || expense.unit.property_id
      expense.update(property_id: property_id)
    end
end
