ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  if ENV['BULLET']
    module MiniTestWithBullet
      def before_setup
        Bullet.start_request
        super if defined?(super)
      end

      def after_teardown
        super if defined?(super)
        Bullet.end_request
      end
    end

    class ActiveSupport::TestCase
      include MiniTestWithBullet
    end
  end
end
