class HardWorker
  include Sidekiq::Worker

  sidekiq_options(queue: :generate_users, backtrace: true)

  def perform(*args)
    user = User.new
    user.name = Faker::Name.name
    user.email = Faker::Internet.email
    user.password = 12345678
    user.save
    sleep 5
  end
end

