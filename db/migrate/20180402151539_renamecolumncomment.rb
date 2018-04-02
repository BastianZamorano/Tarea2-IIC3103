class Renamecolumncomment < ActiveRecord::Migration[5.1]
  def change
  	rename_column :comments, :comentario, :comment
  end
end
