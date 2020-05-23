Dado('ter uma massa configurada a partir das marcas disponíveis do endpoint api_OnlineChallenge_make.get para o cenário {string}') do |tipo|
  @api_onlinechallenge_make_get_marcas = []
  if tipo.eql?('positivo')
    @api_onlinechallenge_make_get = OnlineChallenge.get('/make')
    @api_onlinechallenge_make_get.each do |each_make|
      @api_onlinechallenge_make_get_marcas << each_make['ID']
    end
  else
    @api_onlinechallenge_make_get_marcas << generate_suffix_name(rand(1..10))
  end
end

Quando('chamar o endpoint api_OnlineChallenge_model.get') do
  @api_onlinechallenge_model_get = []
  @api_onlinechallenge_make_get_marcas.each_with_index do |make_id, index|
    query = { 'MakeID' => make_id }
    @api_onlinechallenge_model_get[index] = OnlineChallenge.get('/model', query: query)
  end
end

Então('validar o retorno do endpoint api_OnlineChallenge_model.get de cada modelo de cada marca chamada para o cenário {string}') do |tipo|
  if tipo.eql?('positivo')
    expect(@api_onlinechallenge_model_get.first.code).to eql(api_data_load(%w[http_response_status ok]))
    expect(@api_onlinechallenge_model_get.all? { |each_make| each_make.all? { |each_model| expect(each_model['MakeID']).not_to be_nil } }).to be_truthy
    expect(@api_onlinechallenge_model_get.all? { |each_make| each_make.all? { |each_model| expect(each_model['ID']).not_to be_nil } }).to be_truthy
    expect(@api_onlinechallenge_model_get.all? { |each_make| each_make.all? { |each_model| expect(each_model['Name']).not_to be_nil } }).to be_truthy
    expect(@api_onlinechallenge_model_get.all? { |each_make| each_make.all? { |each_model| api_data_load(%w[models]).any? { |model| model.eql?(each_model['Name']) } } }).to be_truthy
  else
    expect(@api_onlinechallenge_model_get.first.code).to eql(api_data_load(%w[http_response_status bad_request]))
    expect(@api_onlinechallenge_model_get.first['Message']).to eql(api_data_load(%w[default_errors messages message_request_invalid]))
    expect(@api_onlinechallenge_model_get.first['MessageDetail']).to eql(api_data_load(%w[default_errors details details_parameter_contains_null_entry_make_id]))
  end
end
