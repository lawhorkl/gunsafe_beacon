class ScanJob < ApplicationJob
  queue_as :default

  def perform(*args)
    hostname = "http://gun-chip-8/guntracker.txt"
    if ScanHelper.scan(hostname)
      puts 'gun detected!'
      serial = JSON.parse(HTTParty.get(hostname, {timeout: 5}).parsed_response)["serial"]
      alert = Alert.create(message: "Gun detected", location: "Main door", serial: serial)
      result = HTTParty.post('http://localhost:3000/alerts.json',
                             body: alert.to_json(except: [:created_at, :updated_at]),
                             headers: {'Content-Type' => 'application/json'})
    end

    ScanJob.set(wait: 2.seconds).perform_later
  rescue Net::OpenTimeout
    puts 'gun not detected'
    alert = Alert.create(message: "Gun not detected", location: "", serial: nil)
    result = HTTParty.post('http://localhost:3000/alerts.json',
                           body: alert.to_json(except: [:created_at, :updated_at]),
                           headers: {'Content-Type' => 'application/json'})
    ScanJob.set(wait: 2.seconds).perform_later
  end
end
