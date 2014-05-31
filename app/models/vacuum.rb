#encoding: utf-8
class Vacuum
  def initialize file_path
    @file_path = file_path
  end
  def start
    workbook = RubyXL::Parser.parse(@file_path)
    journal = []
    rows = workbook[0].sheet_data.rows
    header = rows.shift 
    rows.each do |row|
      if row[0] && row[1] && row[2] && row[3] && row[4] && row[5]
        transaction = { date: row[0].value,
                        expeditor: row[1].value, 
                        origin: row[2].value, 
                        destination: row[3].value, 
                        amount: row[4].value.to_i, 
                        reference: row[5].value}
        journal.push transaction
      end
    end
    return journal
  end
end
