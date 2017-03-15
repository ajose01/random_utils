require 'csv'

def write_csv(data, number)
  x = "csv_#{number}.csv"
  puts "writing file: #{x}"
  CSV.open(x, "wb") do |csv|
    data.each do |row|
      csv << row
    end
  end
end

CSV($stdin, force_quotes: true) do |csv|
  counter = 0
  file_num = 1
  data = []
  csv.each do |row|
    puts counter
    data << [row[0], row[1], row[2]]
    counter += 1
    if counter == 500
      write_csv(data, file_num)
      file_num += 1
      counter = 0
      data = []
    end 
  end

end

