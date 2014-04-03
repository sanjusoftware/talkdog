class TalksController < ApplicationController
  before_action :set_event
  before_action :set_talk, only: [:show, :edit, :update, :destroy, :rate]
  #skip_before_filter :verify_authenticity_token, :only => :rate, :method => :post

  def index
    @talks = @event.talks.recent
  end

  def archived
    @talks = @event.talks.archieved
    render :template => 'talks/index'
  end

  def rate
    if request.post?
      @rating = @talk.ratings.find_or_initialize_by(:slot => get_slot, :user => current_or_guest_user)
      @rating.value = params[:rating].to_i
      if @rating.save
        render json: @rating
      else
        render text: 'fail'
      end
    elsif request.get?
      @ratings =  @talk.ratings.of_user(current_or_guest_user)
      @talk.attendance = @talk.attendance.present? ?  @talk.attendance + 1 : 1
      @talk.save
    end
  end

  def show
  end

  # GET /talks/new
  def new
    @talk = Talk.new
  end

  # GET /talks/1/edit
  def edit
  end

  # POST /talks
  # POST /talks.json
  def create
    @talk = Talk.new(talk_params)
    @talk.event = @event

    respond_to do |format|
      if @talk.save
        format.html { redirect_to event_talks_path(@event), notice: 'Talk was successfully created.' }
        format.json { render action: 'show', status: :created, location: @talk }
      else
        format.html { render action: 'new' }
        format.json { render json: @talk.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /talks/1
  # PATCH/PUT /talks/1.json
  def update
    respond_to do |format|
      if @talk.update(talk_params)
        format.html { redirect_to @talk, notice: 'Talk was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @talk.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /talks/1
  # DELETE /talks/1.json
  def destroy
    @talk.destroy
    respond_to do |format|
      format.html { redirect_to event_talks_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.friendly.find(params[:event_id])
    end

    def get_slot
      freq = (@talk.end_at - @talk.start_at) / (Talk::SLOT * 60)
      slot = ((Time.now - @talk.start_at) / (60 * freq)).ceil
      ((slot > 0) && (slot <= Talk::SLOT)) ? slot : 0
    end

  def set_talk
      @talk = @event.talks.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def talk_params
      params.require(:talk).permit(:name, :event_id, :abstract, :start_at, :end_at, :download_link, :attendance, :rating, :presenter_ids)
    end
end
