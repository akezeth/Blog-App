require 'rails_helper'

RSpec.describe User, type: :model do
  it 'should not save user without name' do
    user = User.new
    expect(user.valid?).to eq false
  end

  it 'should save user with valid attributes' do
    user = User.new(name: 'Aklilu Mekonnen', posts_counter: 0)
    expect(user.valid?).to eq true
  end

  it 'should not save user with negative posts_counter' do
    user = User.new(name: 'Dawit Aklilu', posts_counter: -1)
    expect(user.valid?).to eq false
  end

  it 'should not save a user if posts_counter is not an integer' do
    user = User.new(name: 'Eden Semret', posts_counter: 'Hi')
    expect(user.valid?).to eq false
  end

  it 'retrieves recent posts' do
    user = User.create(name: 'Ayehu Bire', posts_counter: 0)
    expect(user.valid?).to eq true

    3.times { Post.create(author: user, title: 'Hello World', text: 'This is my first post') }
    expect(user.recent_three_posts.to_a).to eq user.posts.order(created_at: :desc).limit(3).to_a
  end
end
