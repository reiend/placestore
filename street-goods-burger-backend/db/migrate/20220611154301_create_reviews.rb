class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.string :text_body, null: false, default: ''
      t.timestamps
    end
  end
end
