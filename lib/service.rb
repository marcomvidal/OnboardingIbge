require 'faraday'
require 'json'
require 'ostruct'

class Service
  URI = 'https://servicodados.ibge.gov.br/api/'
  URN_PLACES = 'v1/localidades/estados'
  URN_NAMES = 'v2/censos/nomes'
  
  def initialize
    @connection = Faraday.new(url: URI)
  end

  def all_states
    (to_object @connection.get(URN_PLACES)).
      map { |s| OpenStruct.new({ id: s.id, acronym: s.sigla }) }
  end

  def cities_by_state(state)
    (to_object @connection.get("#{URN_PLACES}/#{state.id}/municipios")).
      map { |c| OpenStruct.new({
        id: c.id,
        name: c.nome.upcase,
        state_id: c.microrregiao.mesorregiao.UF.id
      })}
  end

  def names_ranking(params)
    (to_object(@connection.get("#{URN_NAMES}/ranking", params)).first.res).
      map { |n| OpenStruct.new(
        { id: n.id, name: n.nome, rate: n.frequencia, ranking: n.ranking }
      )}
  end

  def name_by_decades(name)
    to_object(@connection.get("#{URN_NAMES}/#{name}"))
  end

  private

  def to_object(response)
    JSON.parse response.body, object_class: OpenStruct
  end
end