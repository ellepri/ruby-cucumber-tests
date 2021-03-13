And(/^I set the query parameters$/) do |table|
  request_options({ query: table.rows_hash })
end

Given(/^I set the request headers$/) do |headers|
  request_options({ headers: headers.rows_hash })
end

When(/^I make a (.*) request to (.*?)(?:|with the following)$/) do |*args|
  method = args[0]
  uri = args[1].strip
  body = args[2]
  request_options({ body: JSON.parse(body) }) unless body.nil?
  request uri, method
end

Then(/^response status code is (\d+)$/) do |code|
  expect(last_response.code).to eql code
end
