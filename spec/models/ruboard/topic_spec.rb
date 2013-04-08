require 'spec_helper'

describe Ruboard::Topic do
  let!(:topic) { FactoryGirl.build(:topic) }

  it 'created with given valid parameters' do
    topic.save!
  end

  describe 'validations' do
    it 'required title' do
      topic.title = ''
      topic.should_not be_valid
    end

    it 'required length title greate than 3 chars' do
      topic.title = 'a'*2
      topic.should_not be_valid
    end

    it 'required length title less than 250 chars' do
      topic.title = 'a'*251
      topic.should_not be_valid
    end
  end

  describe 'protected attributes' do
    [:pinned, :locked].each do |attr|
      it "cannot assign #{attr}" do
        lambda { Ruboard::Topic.new(attr => true) }.should raise_error(ActiveModel::MassAssignmentSecurity::Error)
      end
    end
  end

  describe 'posts' do
    it 'posts must order by created_at desc by default' do
      topic.save!
      topic.posts.to_sql.should =~ /ORDER BY ruboard_posts.created_at DESC/
    end
  end

  describe '#register_view_by' do
    let!(:user) { FactoryGirl.create(:user) }

    it 'increments the overall topic view count' do
      expect {
        topic.register_view_by(user)
      }.to change{topic.views_count}.by(1)
    end

    it 'increments topic view count for user' do
      topic.register_view_by(user)
      topic.view_for(user).count.should eql(1)
    end
  end

  it 'default not pinned' do
    topic.should_not be_pinned
  end

  it 'default not closed' do
    topic.should_not be_closed
  end

  it 'should be has slug for friendly_id' do
    topic.respond_to?(:slug).should eql(true)
  end

end
