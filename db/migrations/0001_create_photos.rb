# frozen_string_literal: true

Sequel.migration do
  up do
    create_table(:photos) do
      primary_key :id
      String :filename, null: false, unique: true
      String :title
      DateTime :created_at
    end
  end

  down do
    drop_table(:photos)
  end
end
