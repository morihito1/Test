class RemoveMultipleFromTitles < ActiveRecord::Migration[5.2]
  def change
    remove_column :books, :title：string, :string
    remove_column :books, :body：text, :string
  end
end
