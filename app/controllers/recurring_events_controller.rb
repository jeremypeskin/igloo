class RecurringEventsController < ApplicationController
  before_action :set_recurring_event, only: [:show, :edit, :update, :destroy]
  before_action :find_user
  before_action :authenticate_user!

  # GET /recurring_events
  # GET /recurring_events.json
  def index
    @recurring_events = @user.recurring_events
  end

  # GET /recurring_events/1
  # GET /recurring_events/1.json
  def show
  end

  # GET /recurring_events/new
  def new
    @recurring_event = RecurringEvent.new
    @units = @user.units
    @properties = @user.properties
  end

  # GET /recurring_events/1/edit
  def edit
    @units = @user.units
    @properties = @user.properties
  end

  # POST /recurring_events
  # POST /recurring_events.json
  def create
    @recurring_event = RecurringEvent.new(recurring_event_params)
    @recurring_event.user_id = @user.id

    respond_to do |format|
      if @recurring_event.save
        format.html { redirect_to @recurring_event, notice: 'Recurring event was successfully created.' }
        format.json { render :show, status: :created, location: @recurring_event }
      else
        format.html { render :new }
        format.json { render json: @recurring_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recurring_events/1
  # PATCH/PUT /recurring_events/1.json
  def update
    respond_to do |format|
      if @recurring_event.update(recurring_event_params)
        format.html { redirect_to @recurring_event, notice: 'Recurring event was successfully updated.' }
        format.json { render :show, status: :ok, location: @recurring_event }
      else
        format.html { render :edit }
        format.json { render json: @recurring_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recurring_events/1
  # DELETE /recurring_events/1.json
  def destroy
    @recurring_event.destroy
    respond_to do |format|
      format.html { redirect_to recurring_events_url, notice: 'Recurring event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recurring_event
      @recurring_event = RecurringEvent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recurring_event_params
      params.require(:recurring_event).permit(:amount, :description, :category, :unit_id, :property_id, :event_type)
    end

    def find_user
      @user = current_user
    end
end
