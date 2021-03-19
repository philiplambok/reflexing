class ImportBooksController < ApplicationController
  def create
    ImportBooksJob.set(wait: 1.seconds).perform_later
    redirect_to root_path
  end
end