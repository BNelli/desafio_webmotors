def api_data_load(keys)
  # busca de massas no arquivo yaml
  data = search(keys, API_STANDARD_DATA || {})
  return data unless data.nil?
  end

def search(keys, data)
  keys = keys.split(' ') if keys.instance_of? String
  keys.each do |key|
    data = data[key]
    break if data.nil?
  end
  data.deep_dup
end

def generate_suffix_name(number)
  [*('A'..'Z')].sample(number).join
end
