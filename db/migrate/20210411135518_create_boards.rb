class CreateBoards < ActiveRecord::Migration[6.1]
  def change
    create_table :boards do |t|
      t.string :person_name
      t.string :company_name
      t.string :work_place
      t.text :body

      t.timestamps
    end
  end
end
