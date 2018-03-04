class ScanJob < ApplicationJob
  queue_as :default

  def perform(*args)
    nums = (0..9).to_a
    for num in nums 
      if ScanHelper.scan("gun-chip-#{num}")
        ScanHelper.send 
    # byebug
    # Do something later
    ScanJob.perform_later
  end
end
