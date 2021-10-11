# frozen_string_literal: true

module StandardHelper
  def request_endpoint(http_method, endpoint, parameters = nil)
    send(http_method, "#{ENV['HOST_URL']}#{endpoint}", params: parameters&.to_json || {},
                                                       headers: build_headers)
  end

  private

  def build_headers
    { 'Content-Type': 'application/json' }
  end
end
