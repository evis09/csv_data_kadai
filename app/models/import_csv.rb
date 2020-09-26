class ImportCsv < ApplicationRecord
  def self.users_data
    path = File.join Rails.root, "db/csv/csv_data.csv"
    list = []
    CSV.foreach(path, headers: true) do |row|
      list << {
        name: row["name"],
        age: row["age"],
        address: row["address"]
      }
    end
    puts "インポート処理を開始"
    begin
      User.create!(list)
      puts "インポート完了!!"
    rescue => exception
      puts "#{e.class}: #{e.message}"
      puts "------------------------"
      puts e.backtrace
      puts "------------------------"
      puts "インポートに失敗"
    end
  end
end