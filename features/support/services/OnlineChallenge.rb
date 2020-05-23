# configuracoes dinamicas do HTTParty
module OnlineChallenge
  include HTTParty
  base_uri 'http://desafioonline.webmotors.com.br/api/OnlineChallenge'
  format :json
  headers 'Content-Type': 'application/json'
end
