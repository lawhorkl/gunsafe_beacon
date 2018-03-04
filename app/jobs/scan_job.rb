class ScanJob < ApplicationJob
  queue_as :default

  def perform(*args)
    byebug
    # Do something later
  end
end
