class Report
  def self.types(params)
    [
      { 
        title: 'Todos',
        filters: { localidade: params[:place].id }
      },
      { 
        title: 'Homens',
        filters: { sexo: 'M', localidade: params[:place].id }
      },
      { 
        title: 'Mulheres',
        filters: { sexo: 'F', localidade: params[:place].id }
      }
    ]
  end
end