category = File.open(File.join(File.dirname(__FILE__), 'categories.txt'))

category.each do |word|
  word = word.chomp
  Category.create(:name => word)
end

