require 'sidekiq'
require 'sidekiq-status'

class Worker
  include Sidekiq::Worker
  include Sidekiq::Status::Worker

  sidekiq_options retry: false, dead: false

  def run time
    100.times do |i|
      total i
      sleep time * 0.01
    end
    total 100
  end

  def perform complexity
    case complexity
    when 'super_hard'
      time = 20
      str = "Really took quite a bit of effort"
    when 'hard'
      time = 10
      str = "That was a bit of work"
    else
      time = 1
      str = "That wasn't a lot of effort"
    end
    run time
    puts str
    store result: time
  end
end
