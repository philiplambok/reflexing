class ImportBooksJob < ApplicationJob
  include CableReady::Broadcaster

  queue_as :default

  def perform(*args)
    (1..10).each do |counter|
      Book.create!(title: Faker::Book.title, author: Faker::Book.author, status: :backlog)
      log = "Successfully importing #{counter} books.."
      cable_ready['import_channel'].inner_html(selector: '#import_logs', html: log)
      cable_ready['import_channel'].inner_html(
        selector: '.books',
        html: HomeController.render(partial: 'books', locals: { books: Book.all })
      )
      cable_ready.broadcast
      sleep 1.seconds
    end
    log = 'The import is complete, thank you for waiting!'
    cable_ready['import_channel'].inner_html(selector: '#import_logs', html: log)
    cable_ready.broadcast
  end
end
