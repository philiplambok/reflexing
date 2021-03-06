class ImportsJob < ApplicationJob
  include CableReady::Broadcaster

  queue_as :default

  def perform(*args)
    # 10.times.each do
    #   Worker.create(name: SecureRandom.hex)
    # end
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
      html: "Importing was completed"
    )
    cable_ready.broadcast
  end
end
