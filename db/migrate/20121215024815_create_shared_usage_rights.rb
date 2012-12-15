class CreateSharedUsageRights < ActiveRecord::Migration
  def change
    create_table :shared_usage_rights do |t|
      t.string :title

      t.timestamps
    end
  end
end
