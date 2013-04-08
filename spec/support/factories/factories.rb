FactoryGirl.define do
  factory :forum, :class => Ruboard::Forum do |f|
    f.title 'Welcome to Ruboard!'
    f.description 'Description forum'
  end

  factory :topic, :class => Ruboard::Topic do |t|
    t.title 'First topic'
    t.association :forum, :factory => :forum
    t.association :user, :factory => :user
    t.posts_attributes { [:body => 'Brand post'] }
  end

  factory :post, :class => Ruboard::Post do |p|
    p.association :topic, :factory => :topic
    p.association :user, :factory => :user
    p.body 'Brand post'
  end

  factory :user do |f|
    f.sequence(:name) {|n| "andrew#{n}"}
    f.sequence(:email) {|n| "andrew#{n}@example.com"}
    f.password "password"
    f.password_confirmation {|u| u.password }
  end
end