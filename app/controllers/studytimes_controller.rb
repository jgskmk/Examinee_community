class StudytimesController < ApplicationController
  before_action :set_studytime, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user
  before_action :ensure_studytime_user, only: [:show, :edit, :update, :destroy]
  # GET /studytimes
  # GET /studytimes.json
  def index
    @studytimes = Studytime.where(user_id: @current_user.id).order(date: :asc)

  end

  def studytimes_all
    @studytimes = Studytime.where(user_id: @current_user.id).order(date: :asc)
  end

  # GET /studytimes/1
  # GET /studytimes/1.json
  def show
  end

  # GET /studytimes/new
  def new
    @studytime = Studytime.new
  end

  # GET /studytimes/1/edit
  def edit
  end

  # POST /studytimes
  # POST /studytimes.json
  def create
    @studytime = Studytime.new(studytime_params)
    @studytime.user_id = @current_user.id
    @studytime.total_minutes=@studytime.hours * 60 + @studytime.minutes

    respond_to do |format|
      if @studytime.save
        format.html { redirect_to @studytime, notice: 'Studytime was successfully created.' }
        format.json { render :show, status: :created, location: @studytime }
      else
        format.html { render :new }
        format.json { render json: @studytime.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /studytimes/1
  # PATCH/PUT /studytimes/1.json
  def update
    if @studytime.update(studytime_params)
      @studytime.total_minutes=@studytime.hours * 60 + @studytime.minutes
    end
    respond_to do |format|
      if @studytime.update(studytime_params)
        @studytime.total_minutes=@studytime.hours * 60 + @studytime.minutes
        format.html { redirect_to @studytime, notice: 'Studytime was successfully updated.' }
        format.json { render :show, status: :ok, location: @studytime }
      else
        format.html { render :edit }
        format.json { render json: @studytime.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /studytimes/1
  # DELETE /studytimes/1.json
  def destroy
    @studytime.destroy
    respond_to do |format|
      format.html { redirect_to studytimes_url, notice: 'Studytime was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_studytime
      @studytime = Studytime.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def studytime_params
      params.require(:studytime).permit(:hours, :minutes, :date)
    end

    def ensure_studytime_user
      @studytime = Studytime.find(params[:id])
      if @current_user.id != @studytime.user_id.to_i
        flash[:notice] = "権限がありません。"
        redirect_to("/home/top/1")
      end
    end
end
