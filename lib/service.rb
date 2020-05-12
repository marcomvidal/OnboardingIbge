require 'faraday'
require 'json'
require 'ostruct'
require_relative 'models/city'
require_relative 'models/decade'
require_relative 'models/name'
require_relative 'models/state'

class Service
  URI = 'https://servicodados.ibge.gov.br/api/'
  
  def initialize
    @connection = Faraday.new(url: URI)
  end

  def all_states
    url = 'v1/localidades/estados'

    (to_object @connection.get url).map { |s|
      State.new(id: s.id, acronym: s.sigla)
    }
  end

  def all_cities
    url = "v1/localidades/municipios"

    (to_object @connection.get url).map { |c| City.new(
      id: c.id,
      name: c.nome,
      state_id: c.microrregiao.mesorregiao.UF.id
    )}
  end

  def cities_by_state(state)
    url = "v1/localidades/estados/#{state.id}/municipios"

    (to_object @connection.get url).map { |c| City.new(
      id: c.id,
      name: c.nome,
      state_id: c.microrregiao.mesorregiao.UF.id
    )}
  end

  def names_ranking(params)
    url = "v2/censos/nomes/ranking"

    (to_object @connection.get(url, params)).first.res.map { |n|
      Name.new(id: n.id, name: n.nome, rate: n.frequencia, ranking: n.ranking)
    }
  end

  def name_on_decades(name)
    url = "v2/censos/nomes/#{name}"

    (to_object(@connection.get url)).first.res.map { |d|
      Decade.new(decade: d.periodo, frequency: d.frequencia)
    }
  end

  private

  def to_object(response)
    JSON.parse response.body, object_class: OpenStruct
  end
end