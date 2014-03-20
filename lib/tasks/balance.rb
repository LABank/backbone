namespace :balance do
  desc "process xls file -- for example, balance:xls[path_to_file]"
  task :xls, [:path] => :environment do |t, args|
    path = args[:path]
    raise "#{path} does not exist!" unless File.exists?(path)
    raise "#{path} is not a file!" if File.directory?(path)

    puts "Importing: #{path}"
    v = Vacuum.new(path)
    v.start
    puts "Imported #{v.imported_questions} question(s)"
  end
end