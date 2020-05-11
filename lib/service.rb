require 'faraday'
require 'json'
require 'ostruct'
require 'require_all'
require_relative 'models/city'
require_relative 'models/decade'
require_relative 'models/name'
require_relative 'models/state'

class Service
  URI = 'https://servicodados.ibge.gov.br/api/'
  URN_PLACES = 'v1/localidades/estados'
  URN_NAMES = 'v2/censos/nomes'
  
  def initialize
    @connection = Faraday.new(url: URI)
  end

  def all_states
    (to_object @connection.get(URN_PLACES)).map { |s|
      State.new(id: s.id, acronym: s.sigla)
    }
  end

  def cities_by_state(state)
    url = "#{URN_PLACES}/#{state.id}/municipios"

    (to_object @connection.get url).map { |c| City.new(
      id: c.id,
      name: c.nome,
      state_id: c.microrregiao.mesorregiao.UF.id
    )}
  end

  def names_ranking(params)
    url = "#{URN_NAMES}/ranking"

    (to_object @connection.get(url, params)).first.res.map { |n|
      Name.new(id: n.id, name: n.nome, rate: n.frequencia, ranking: n.ranking)
    }
  end

  def name_on_decades(name)
    url = "#{URN_NAMES}/#{name}"

    (to_object(@connection.get url)).first.res.map { |d|
      Decade.new(decade: d.periodo, frequency: d.frequencia)
    }
  end

  private

  def to_object(response)
    JSON.parse response.body, object_class: OpenStruct
  end
end