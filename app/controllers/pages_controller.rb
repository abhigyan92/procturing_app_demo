class PagesController < ApplicationController
  def home
    @user = User.new
  end

  def create_user
    @user = User.find_by_email(params[:email])
    if !@user.present?
      @user = User.create(email: params[:email])
    end
    @submission = @user.submissions.create
    redirect_to take_test_path(@submission)
  end

  def take_test
    @submission = Submission.find(params[:submission_id])
    @user = @submission.user
  end

  def display_activity_log
    @user = User.find(params[:user_id])
    @submissions = @user.submissions.order(created_at: :desc).all
    @recording = @user.test_recordings.last
  end

  def record_event
    permitted = params.permit(:name, :value, :submissionID)
    @submission = Submission.find(permitted[:submissionID])
    @user = @submission.user
    @procturing_event = @submission.procturing_events.build
    @procturing_event.name = permitted[:name]
    @procturing_event.value = permitted[:value]
    @procturing_event.user_id = @user.id
    @procturing_event.save
    render :json => @procturing_event
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
