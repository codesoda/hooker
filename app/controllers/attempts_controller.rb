class AttemptsController < ApplicationController
  before_action :set_attempt, only: [:show, :edit, :update, :destroy]

  # GET /attempts
  def index
    @attempts = Attempt.all
  end

  # GET /attempts/1
  def show
  end

  # GET /attempts/new
  def new
    @attempt = Attempt.new
  end

  # GET /attempts/1/edit
  def edit
  end

  # POST /attempts
  def create
    @attempt = Attempt.new(attempt_params)

    if @attempt.save
      redirect_to @attempt, notice: 'Attempt was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /attempts/1
  def update
    if @attempt.update(attempt_params)
      redirect_to @attempt, notice: 'Attempt was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /attempts/1
  def destroy
    @attempt.destroy
    redirect_to attempts_url, notice: 'Attempt was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attempt
      @attempt = Attempt.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def attempt_params
      params.require(:attempt).permit(:call_id, :url, :http_code, :http_status, :status)
    end
end
