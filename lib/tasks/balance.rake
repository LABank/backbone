namespace :balance do
  desc "process xls file -- for example, balance:xls[path_to_file]"
  task :xls, [:path] => :environment do |t, args|
    path = args[:path]
    raise "#{path} does not exist!" unless File.exists?(path)
    raise "#{path} is not a file!" if File.directory?(path)

    puts "Importing: #{path}"
    v = Vacuum.new(path)
    transaction = v.start

    puts '*************************'
    puts 'Balance'
    accounts = {}
    transaction.each do |t|
      accounts[t[:origin]] = 0 if accounts[t[:origin]] == nil
      accounts[t[:destination]] = 0 if accounts[t[:destination]] == nil

      accounts[t[:origin]] = accounts[t[:origin]] - t[:amount]
      accounts[t[:destination]] = accounts[t[:destination]] + t[:amount]
    end
    accounts.each do |account, amount|
      puts "#{account} => #{amount}" if account != 'LABanque' and account != nil
    end

    puts '*************************'
    puts 'LAB vs Members ratio'
   
    labtomembers = 0
    memberstomembers = 0
    total = 0
    transaction.each do |t|  
      if t[:origin] != "LABanque" and t[:destination] != "LABanque"    
        if t[:origin] == "LAB" or t[:destination] == "LAB"
          labtomembers += t[:amount]
        else
          memberstomembers += t[:amount]
        end
        total += t[:amount]
      end
      
    end
    puts "Total exchanged: #{total}"
    puts "LAB to Members ratio: #{(labtomembers*100.0/total).round(1)}%"
    puts "Members to Members ratio: #{(memberstomembers*100.0/total).round(1)}%"
  end
end