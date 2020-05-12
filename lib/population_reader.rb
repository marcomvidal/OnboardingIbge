require_relative 'models/population'

class PopulationReader
  def self.all
    file = File.open 'populacao_2019.csv'

    file.readlines.map do |line|
      data = line.tr('"', '').split ','

      Population.new(
        type: data[0], id: data[1], name: data[2], population: data[3]
      )
    end
  end
end
