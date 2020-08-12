class CreateRegrets < ActiveRecord::Migration[5.2]
  def change
    create_table :regrets do |t|
      t.references :user, foreign_key: { on_delete: :cascade }, index: { unique: true }
      t.text :body, null: false
      t.timestamps
    end
  end
end
