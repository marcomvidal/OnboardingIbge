require 'faraday'
require 'json'
require 'ostruct'

class Service
  URI = 'https://servicodados.ibge.gov.br/api/'
  
  def initialize
    @connection = Faraday.new(url: URI)
  end

  def all_states
    to_object @connection.get('v1/localidades/estados')
  end

  def names_by(params)
    to_object(@connection.get('v2/censos/nomes/ranking', params))[0].res
  end

  private

  def to_object(response)
    JSON.parse response.body, object_class: OpenStruct
  end
end