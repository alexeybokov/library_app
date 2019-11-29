namespace :app do

  desc 'Create fake database for app'
  task create_data: :environment do
    create_user
    create_books
    create_comments
  end

  def create_user
    User.create!(nickname: Faker::Name.male_first_name,
                 email: 'developer@gmail.com',
                 password: '123456')
    puts 'Create User....................................................................'
  end

  def create_books
    20.times do
      book = Book.create!(title: Faker::Book.title,
                          author: Faker::Name.first_name + ' ' + Faker::Name.last_name,
                          user_id: User.first.id,
                          description: Faker::Lorem.sentence(50, true).chop,
                          status: true)
      puts "Create Book #{book.title} ..................................................."
    end
  end

  def create_comments
    5.times do
      Comment.create!(user_id: User.first.id,
                      book_id: Book.last.id,
                      body: Faker::Lorem.sentence(15, true).chop)
      puts 'Create Comment ..............................................................'
    end
  end
end
