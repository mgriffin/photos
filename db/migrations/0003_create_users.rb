# frozen_string_literal: true

Sequel.migration do
  up do
    create_table(:users) do
      primary_key :id
      String :login, null: false, unique: true
      String :name
      String :email
      DateTime :created_at
    end

    alter_table(:photos) do
      add_foreign_key :user_id, :users
    end

    alter_table(:galleries) do
      add_foreign_key :user_id, :users
    end
  end

  down do
    drop_table(:users)
  end
end
