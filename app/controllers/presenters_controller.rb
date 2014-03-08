class PresentersController < ApplicationController
  before_action :set_presenter, only: [:show, :edit, :update, :destroy]

  # GET /presenters
  # GET /presenters.json
  def index
    @presenters = Presenter.all
  end

  # GET /presenters/1
  # GET /presenters/1.json
  def show
  end

  # GET /presenters/new
  def new
    @presenter = Presenter.new
  end

  # GET /presenters/1/edit
  def edit
  end

  # POST /presenters
  # POST /presenters.json
  def create
    @presenter = Presenter.new(presenter_params)

    respond_to do |format|
      if @presenter.save
        format.html { redirect_to @presenter, notice: 'Presenter was successfully created.' }
        format.json { render action: 'show', status: :created, location: @presenter }
      else
        format.html { render action: 'new' }
        format.json { render json: @presenter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /presenters/1
  # PATCH/PUT /presenters/1.json
  def update
    respond_to do |format|
      if @presenter.update(presenter_params)
        format.html { redirect_to @presenter, notice: 'Presenter was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @presenter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /presenters/1
  # DELETE /presenters/1.json
  def destroy
    @presenter.destroy
    respond_to do |format|
      format.html { redirect_to presenters_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_presenter
      @presenter = Presenter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def presenter_params
      params.require(:presenter).permit(:name, :bio, :twitter_handle, :email, :talk_id)
    end
end
