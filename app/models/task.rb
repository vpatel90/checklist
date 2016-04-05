class Task < ActiveRecord::Base
  belongs_to :list

  def to_json( _ = nil)
    {
      id: self.id,
      list_id: self.list_id
      body: self.body,
      compelete: self.status,
      created_at: self.created_at,
      updated_at: self.updated_at,
    }
  end
end
