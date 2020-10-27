# frozen_string_literal: true

Sequel.migration do
  up do
    create_table(:galleries) do
      primary_key :id
      String :title
      String :slug
      DateTime :created_at
    end

    alter_table(:photos) do
      add_foreign_key :gallery_id, :galleries
    end
  end

  down do
    drop_table(:galleries)

    drop_column :photos, :gallery_id
  end
end
