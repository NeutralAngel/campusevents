require 'date'
class MeetingsController < ApplicationController
  before_action :set_meeting, only: [:show, :edit, :update, :destroy]

  # GET /meetings
  # GET /meetings.json
  def index
    @meetings = Meeting.all
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
    set_date
    @meeting = Meeting.new(meeting_params)

    respond_to do |format|
      if @meeting.save
        format.html { redirect_to @meeting, notice: 'Meeting was successfully created.' }
        format.json { render action: 'show', status: :created, location: @meeting }
      else
        format.html { render action: 'new' }
        format.json { render json: @meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /meetings/1
  # PATCH/PUT /meetings/1.json
  def update
    set_date
    respond_to do |format|
      if @meeting.update(meeting_params)
        format.html { redirect_to @meeting, notice: 'Meeting was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meetings/1
  # DELETE /meetings/1.json
  def destroy
    @meeting.destroy
    respond_to do |format|
      format.html { redirect_to meetings_url }
      format.json { head :no_content }
    end
  end

  private
  
    # Use callbacks to share common setup or constraints between actions.
    def set_meeting
      @meeting = Meeting.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def meeting_params
      params.require(:meeting).permit(:name, :description, :start_time, :end_time, :location_id, :event_id)
    end

    def set_date
      begin_date = Date.strptime(params[:meeting]['start_time'], '%m-%d-%Y')
      end_date = Date.strptime(params[:meeting]['end_time'], '%m-%d-%Y')

      params[:meeting]['start_time'] = ''
      params[:meeting]['end_time'] = ''
      params[:meeting]['start_time(1i)'] = begin_date.year.to_s
      params[:meeting]['start_time(2i)'] = begin_date.month.to_s
      params[:meeting]['start_time(3i)'] = begin_date.mday.to_s
      params[:meeting]['end_time(1i)'] = end_date.year.to_s
      params[:meeting]['end_time(2i)'] = end_date.month.to_s
      params[:meeting]['end_time(3i)'] = end_date.mday.to_s
    end
end
