class List < ActiveRecord::Base
  has_many :tasks

  def to_json( _ = nil)
    {
      id: self.id,
      name: self.name,
      created_at: self.created_at,
      updated_at: self.updated_at,
    }.to_json
  end
end
