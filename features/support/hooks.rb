# This hook prints out the URL for failed test in the report and console
After do |scenario|
  log(last_response.request_url)
  # log(last_response.request_url) if scenario.failed?
end
