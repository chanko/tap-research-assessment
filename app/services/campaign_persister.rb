class CampaignPersister
  attr_reader :id, :cpi, :length_of_interview, :name

  def initialize(json)
    @id = json['id']
    @cpi = json['cpi']
    @length_of_interview = json['length_of_interview']
    @name = json['name']
  end

  def persist
    Campaign.create_with(
      cpi: cpi,
      length_of_interview: length_of_interview,
      name: name
    ).find_or_create_by(id: id)
  end
end
