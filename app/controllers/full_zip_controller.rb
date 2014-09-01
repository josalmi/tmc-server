class FullZipController < ApplicationController

  def index
    submission = Submission.find(params[:submission_id])
    authorize! :read, submission
    exercise = submission.exercise
    data = SubmissionPackager.get(exercise).get_submission_with_tests(submission)
    name = "#{submission.user.login}-#{exercise.name}-#{submission.id}_full.zip"
    send_data(data, filename: name)
  end

end