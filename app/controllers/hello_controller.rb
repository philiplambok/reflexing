class HelloController < ApplicationController
  def index
    if params[:worker].eql?('true')
      ImportsJob.set(wait: 1.second).perform_later
      redirect_to hello_index_path
    end
  end
end
