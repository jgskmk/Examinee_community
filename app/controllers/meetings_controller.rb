class MeetingsController < ApplicationController
  before_action :set_meeting, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user
  before_action :ensure_meeting_user, only: [:show, :edit, :update, :destroy]
  # GET /meetings
  # GET /meetings.json
  def index
    @meetings = Meeting.where(user_id: @current_user.id).order(start_time: :asc)
  end

  def meetings_all
    @meetings = Meeting.where(user_id: @current_user.id).order(start_time: :asc)
  end
  # GET /meetings/1
  # GET /meetings/1.json
  def show
  end

  # GET /meetings/new
  def new
    @meeting = Meeting.new
  end

  # GET /meetings/1/edit
  def edit
  end

  # POST /meetings
  # POST /meetings.json
  def create
    @meeting = Meeting.new(meeting_params)
    @meeting.user_id=@current_user.id

    respond_to do |format|
      if @meeting.save
        format.html { redirect_to @meeting, notice: '予定を作成しました。' }#redirect_to model_url(id: @model.id)
        format.json { render :show, status: :created, location: @meeting }
      else
        format.html { render :new }
        format.json { render json: @meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /meetings/1
  # PATCH/PUT /meetings/1.json
  def update
    respond_to do |format|
      if @meeting.update(meeting_params)
        format.html { redirect_to @meeting, notice: '予定を更新しました。' }
        format.json { render :show, status: :ok, location: @meeting }
      else
        format.html { render :edit }
        format.json { render json: @meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meetings/1
  # DELETE /meetings/1.json
  def destroy
    @meeting.destroy
    respond_to do |format|
      format.html { redirect_to meetings_url, notice: '予定を削除しました。' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meeting
      @meeting = Meeting.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def meeting_params
      params.require(:meeting).permit(:name, :start_time, :end_time)
    end

    def ensure_meeting_user
      @meeting = Meeting.find(params[:id])
      if @current_user.id != @meeting.user_id
        flash[:notice] = "権限がありません。"
        redirect_to("/home/top/1")
      end
    end


end
