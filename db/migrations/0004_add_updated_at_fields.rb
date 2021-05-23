# frozen_string_literal: true

Sequel.migration do
  up do
    alter_table(:galleries) do
      add_column :updated_at, DateTime
    end
    alter_table(:photos) do
      add_column :updated_at, DateTime
    end
    alter_table(:users) do
      add_column :updated_at, DateTime
    end
  end

  down do
    alter_table(:galleries) do
      drop_column :updated_at
    end
    alter_table(:photos) do
      drop_column :updated_at
    end
    alter_table(:users) do
      drop_column :updated_at
    end
  end
end
