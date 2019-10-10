class JobsController < ApplicationController

	def index
		redirect_to root_path if params[:user_id] != current_user.username
		@request = Request.find(params[:request_id])
		@titles = @request.job_titles.map(&:job_title).join(', ')
		@jobs = @request.jobs.order(source: :desc)
	end

end
