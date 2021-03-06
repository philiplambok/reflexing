class SampleChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'sample_channel'
  end
end
