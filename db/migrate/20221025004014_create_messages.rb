class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.string :content
      t.string :session_id
      t.references :room, foreign_key: true
      t.timestamps
    end
  end
end
