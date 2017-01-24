# workers Integer(ENV['WEB_CONCURRENCY'] || 2)
# threads_count = Integer(ENV['RAILS_MAX_THREADS'] || 5)

workers ENV.fetch("WEB_CONCURRENCY") { 2 }

threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }.to_i
threads threads_count, threads_count

preload_app!

rackup      DefaultRackup
port        ENV.fetch["PORT"] { 3000 }
environment ENV.fetch["RACK_ENV"] { "development" }
# environment ENV.fetch("RAILS_ENV") { "development" }

on_worker_boot do
  # Worker specific setup for Rails 4.1+
  # See: #1 link on Guide section below

  ActiveRecord::Base.establish_connection
end

=begin

# Guide:
  1. https://devcenter.heroku.com/articles/deploying-rails-applications-with-the-puma-web-server#on-worker-boot

  2. https://github.com/codetriage/codetriage/blob/master/config/puma.rb


# Though Rails is thread safe it doesn't guarantee your code will be.
  If you haven't run your application in a threaded environment we
  recommend deploying and setting MIN_THREADS and RAILS_MAX_THREADS both
  to 1.

  $ heroku config:set MIN_THREADS=1 RAILS_MAX_THREADS=1
  $ heroku config:set RAILS_MAX_THREADS=1

=end