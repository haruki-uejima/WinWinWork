class CreateTags < ActiveRecord::Migration[6.1]
  def change
    create_table :tags do |t|
      t.string :namen, null: false

      t.timestamps
    end
  end
end
