# frozen_string_literal: true

class AddColumnAdminToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :admin, :boolean, default: false
  end
end
