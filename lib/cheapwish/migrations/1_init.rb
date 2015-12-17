# Initialize stuff. Main tables with all the required information

Sequel.migration do
  change do
    create_table(:users) do
      primary_key :id
      String :name, text: true
      String :url, text: true
    end

    create_table(:games) do
      primary_key :id
      String :name, text: true
      Float :price
      String :url, text: true
    end

    create_table(:sale) do
      primary_key :id
      DateTime :created_at
      Float :percent_off
      Float :new_price
    end
  end
end
