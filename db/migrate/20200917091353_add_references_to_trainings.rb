class AddReferencesToTrainings < ActiveRecord::Migration[6.0]
  def change
    add_reference :trainings, :user, foreign_key: true
  end
end
