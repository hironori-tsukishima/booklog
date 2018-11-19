class CreateContents < ActiveRecord::Migration[5.0]
  def change
    create_table :contents do |t|
      t.text      :title, null: false
      t.text      :summary
      t.text      :text
      t.text      :image
      t.timestamps null:true
    end
  end
end
