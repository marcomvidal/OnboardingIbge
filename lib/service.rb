require 'faraday'
require 'json'
require 'ostruct'

class Service
  URI = 'https://servicodados.ibge.gov.br/api/v1/localidades'
  
  def initialize
    @connection = Faraday.new(url: URI)
  end

  def get_all_states
    to_object(@connection.get('estados'))
  end

  private

  def to_object(response)
    JSON.parse(response.body, object_class: OpenStruct)
  end
end