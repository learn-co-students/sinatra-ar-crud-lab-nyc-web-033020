
Article.destroy_all

5.times do
    Article.create(title: Faker::Book.title, content: Faker::Books::Lovecraft.sentence)
end