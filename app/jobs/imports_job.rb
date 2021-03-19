class ImportsJob < ApplicationJob
  include CableReady::Broadcaster

  queue_as :default

  def perform(*args)
    (1..10).each do |index|
      cable_ready['sample_channel'].inner_html(
        selector: '#logs',
        html: "Importing #{index} user.."
      )
      cable_ready.broadcast
      sleep 1.seconds
    end
    cable_ready['sample_channel'].inner_html(
      selector: '#logs',
      html: 'Completed, thank you for waiting!'
    )
    cable_ready.broadcast
  end
end
