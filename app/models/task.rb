class Task < ActiveRecord::Base
  belongs_to :list

  before_create :update_position

  def update_position
    tsks = self.list.tasks.where("position >= #{self.position}")
    tsks.each do |task|
      task.position = task.position + 1
      task.save
    end
  #  List.where(:position >= self.position).update_all(:position = :position + 1)
  end
end
