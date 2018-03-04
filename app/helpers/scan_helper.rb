module ScanHelper
  def self.scan(hostname)
    HTTParty.get(hostname, {timeout: 5})
  end

  def self.get_http(hostname)
  end
end
