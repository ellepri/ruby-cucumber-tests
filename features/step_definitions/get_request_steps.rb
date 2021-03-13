And(/^response headers contain following$/) do |headers|
  headers.rows_hash.each { |key, value| expect(last_response.headers[:"#{key}"]).to eql value }
end

And(/^all the uris in the response body contain following query parameter$/) do |table|
  table.raw.flatten.each do |row|
    JsonPath.new('$..uri').on(last_response.body).to_a.map { |uri| expect(uri).to include(row) }
  end
end

And(/^response should contain following for module$/) do |table|
  module_json_path = "$..[?(@.id=='#{table.rows_hash['id']}')]"
  table.raw.each do |row|
    json_path_result = JsonPath.new("#{module_json_path}.#{row[0]}").on(last_response.body).to_a
    expect(json_path_result).not_to be_empty, "JsonPath #{module_json_path} has not returned anything, check your expression\n"
    json_path_result.map { |json| expect(json).to eql row[1] }
  end
end
