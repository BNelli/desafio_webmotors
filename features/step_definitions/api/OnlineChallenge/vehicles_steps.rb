Quando('chamar o endpoint api_OnlineChallenge_vehicles.get para o cenário {string}') do |tipo|
  pages = 1
  @api_onlinechallenge_vehicles_get_vehicles = []
  if tipo.eql?('positivo')
    while pages.positive?
      query = { 'Page' => pages }
      @api_onlinechallenge_vehicles_get_vehicles[pages] = OnlineChallenge.get('/Vehicles', query: query)
      @api_onlinechallenge_vehicles_get_vehicles.last.empty? ? pages = 0 : pages += 1
    end
  else
    query = { 'Page' => generate_suffix_name(3) }
    @api_onlinechallenge_vehicles_get_vehicles[pages] = OnlineChallenge.get('/Vehicles', query: query)
  end
end

Então('validar o retorno do endpoint api_OnlineChallenge_vehicles.get de cada vehículo em cada página chamada para o cenário {string}') do |tipo|
  @api_onlinechallenge_vehicles_get_vehicles.compact!
  if tipo.eql?('positivo')
    expect(@api_onlinechallenge_vehicles_get_vehicles.first.code).to eql(api_data_load(%w[http_response_status ok]))
    expect(@api_onlinechallenge_vehicles_get_vehicles.all? { |each_element| each_element.all? { |each_vehicle| expect(each_vehicle['ID']).not_to be_nil } }).to be_truthy
    expect(@api_onlinechallenge_vehicles_get_vehicles.all? { |each_element| each_element.all? { |each_vehicle| expect(each_vehicle['Make']).not_to be_nil } }).to be_truthy
    expect(@api_onlinechallenge_vehicles_get_vehicles.all? { |each_element| each_element.all? { |each_vehicle| expect(each_vehicle['Model']).not_to be_nil } }).to be_truthy
    expect(@api_onlinechallenge_vehicles_get_vehicles.all? { |each_element| each_element.all? { |each_vehicle| expect(each_vehicle['Version']).not_to be_nil } }).to be_truthy
    expect(@api_onlinechallenge_vehicles_get_vehicles.all? { |each_element| each_element.all? { |each_vehicle| expect(each_vehicle['Image']).not_to be_nil } }).to be_truthy
    expect(@api_onlinechallenge_vehicles_get_vehicles.all? { |each_element| each_element.all? { |each_vehicle| expect(each_vehicle['KM']).not_to be_nil } }).to be_truthy
    expect(@api_onlinechallenge_vehicles_get_vehicles.all? { |each_element| each_element.all? { |each_vehicle| expect(each_vehicle['Price']).not_to be_nil } }).to be_truthy
    expect(@api_onlinechallenge_vehicles_get_vehicles.all? { |each_element| each_element.all? { |each_vehicle| expect(each_vehicle['YearModel']).not_to be_nil } }).to be_truthy
    expect(@api_onlinechallenge_vehicles_get_vehicles.all? { |each_element| each_element.all? { |each_vehicle| expect(each_vehicle['YearFab']).not_to be_nil } }).to be_truthy
    expect(@api_onlinechallenge_vehicles_get_vehicles.all? { |each_element| each_element.all? { |each_vehicle| expect(each_vehicle['Color']).not_to be_nil } }).to be_truthy
  else
    expect(@api_onlinechallenge_vehicles_get_vehicles.first.code).to eql(api_data_load(%w[http_response_status bad_request]))
    expect(@api_onlinechallenge_vehicles_get_vehicles.first['Message']).to eql(api_data_load(%w[default_errors messages message_request_invalid]))
    expect(@api_onlinechallenge_vehicles_get_vehicles.first['MessageDetail']).to eql(api_data_load(%w[default_errors details details_parameter_contains_null_entry_page]))
  end
end