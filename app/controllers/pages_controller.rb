class PagesController < ApplicationController
  def home
    @user = User.new
  end

  def create_user
    @user = User.find_by_email(params[:email])
    if !@user.present?
      @user = User.create(email: params[:email])
    end
    redirect_to take_test_path(@user)
  end

  def take_test
    @user = User.find(params[:user_id])
  end

  def display_activity_log
    @user = User.find(params[:user_id])
    @procturing_events = @user.procturing_events
    @recording = @user.test_recordings.last

  end

  def record_event
    permitted = params.permit(:name, :value, :userId)
    @user = User.find(permitted[:userId])
    @procturing_event = @user.procturing_events.build
    @procturing_event.name = permitted[:name]
    @procturing_event.value = permitted[:value]
    @procturing_event.save
    render :json => @procuring_event
  end

  def save_recording
    @recording = TestRecording.new(params.require(:recording).permit(:video, :user_id))
    if @recording.save
      render :json => @recording
    else
      render :json => {status: 500}
    end
  end
end
