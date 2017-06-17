require 'json'
require 'csv'

file_1 = File.read('name_dob_height.json')
file_2 = File.read('name_dob_salary.json')

data_1 = JSON.parse(file_1)
data_2 = JSON.parse(file_2)

merge = data_1.zip(data_2).map { |f, s| f.merge(s) }

data = merge.sort_by {|h| [h["Date_of_birth"], h["Salary"], h["Height"]]}

CSV.open('./output.csv', 'wb') do |csv|
  csv << ['First Name', 'Lats Name', 'DOB', 'Salary', 'Height']

  data.each do |m|
      row = []
      row << m["First_name"]
      row << m["Last_name"]
      row << m["Date_of_birth"]
      row << m["Salary"]
      row << m["Height"]
      csv << row
    end
end