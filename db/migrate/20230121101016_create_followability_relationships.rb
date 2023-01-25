class CreateFollowabilityRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :followability_relationships do |t|
      t.belongs_to :followerable, polymorphic: true , index: { name: :my_index1 }
      t.belongs_to :followable, polymorphic: true, index: { name: :my_index2 }
      t.integer :status
    end
  end
end
