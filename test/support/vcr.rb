require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = Rails.root.join 'test', 'vcr_cassettes'
  c.hook_into :webmock
  c.allow_http_connections_when_no_cassette = false
end
