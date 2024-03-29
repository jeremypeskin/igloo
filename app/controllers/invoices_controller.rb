class InvoicesController < ApplicationController
  before_action :set_invoice, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :find_user

  # GET /invoices
  # GET /invoices.json
  def index
    @invoices = @user.invoices.order(date: :desc).filter(params.slice(:property)).paginate(page: params[:page], per_page: 5)
    @sum_of_invoices = @user.invoices.filter(params.slice(:property)).sum(:amount)
  end

  # GET /invoices/1
  # GET /invoices/1.json
  def show
  end

  # GET /invoices/new
  def new
    @invoice = Invoice.new
    @units = @user.units
  end

  # GET /invoices/1/edit
  def edit
    @units = @user.units
  end

  # POST /invoices
  # POST /invoices.json
  def create
    @invoice = Invoice.new(invoice_params)
    @invoice.user_id = @user.id
    set_property_id(@invoice)

    respond_to do |format|
      if @invoice.save
        format.html { redirect_to @invoice, notice: 'Invoice was successfully created.' }
        format.json { render :show, status: :created, location: @invoice }
      else
        format.html { render :new }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invoices/1
  # PATCH/PUT /invoices/1.json
  def update
    set_property_id(@invoice)
    respond_to do |format|
      if @invoice.update(invoice_params)
        format.html { redirect_to @invoice, notice: 'Invoice was successfully updated.' }
        format.json { render :show, status: :ok, location: @invoice }
      else
        format.html { render :edit }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invoices/1
  # DELETE /invoices/1.json
  def destroy
    @invoice.destroy
    respond_to do |format|
      format.html { redirect_to invoices_url, notice: 'Invoice was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def pay
    Invoice.where(id: params[:invoice_ids]).update_all(status: 1, date: Date.today)
    redirect_to invoices_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invoice
      @invoice = Invoice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def invoice_params
      params.require(:invoice).permit(:description, :amount, :date, :status, :unit_id, :property_id, :user_id)
    end

    def find_user
      @user = current_user
    end

    def set_property_id(invoice)
      property_id = invoice.property_id.presence || invoice.unit.property_id
      invoice.update(property_id: property_id)
    end
end
