class ChangeColumnNameCommentsForBody < ActiveRecord::Migration[5.1]
  def change
  	rename_column :comments, :comment, :comentario
  end
end
