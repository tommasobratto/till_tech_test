require 'json'

public

def load_files
  json = File.read('hipstercoffee.json')
  file = JSON.parse(json).first
  @menu = file['prices'].first
end
