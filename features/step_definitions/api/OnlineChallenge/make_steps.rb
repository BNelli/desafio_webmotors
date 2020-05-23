Quando('chamar o endpoint api_OnlineChallenge_make.get') do
  @api_onlinechallenge_make_get = OnlineChallenge.get('/make')
end

Então('validar o retorno do endpoint api_OnlineChallenge_make.get') do
  expect(@api_onlinechallenge_make_get.code).to eql(api_data_load(%w[http_response_status ok]))
  expect(@api_onlinechallenge_make_get.all? { |value| expect(value['ID']).not_to be_nil }).to be_truthy
  expect(@api_onlinechallenge_make_get.all? { |value| expect(value['Name']).not_to be_nil }).to be_truthy
  expect(@api_onlinechallenge_make_get.all? { |response| api_data_load(%w[makes]).any? { |data| data.eql?(response['Name']) } }).to be_truthy
end
