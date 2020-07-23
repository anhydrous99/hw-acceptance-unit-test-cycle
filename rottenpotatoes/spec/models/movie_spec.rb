require 'rails_helper'
require 'spec_helper'

RSpec.describe Movie, type: :model do

  let!(:first) { create(:movie, title: 'tst1', director: 'd1') }
  let!(:second) { create(:movie, title: 'tst2', director: 'd1') }
  let!(:third) { create(:movie, title: 'tst3') }
  let!(:fourth) { create(:movie, title: 'tst4', director: 'd2') }

  it "has a valid factory" do
    expect(build(:movie)).to be_valid
  end

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  describe ".movies_with_same_director" do
    it 'returns associated movies' do
      expect(Movie.movies_with_same_director(first).select(:id).ids).to eq([second.id])
    end

    it 'returns empty array when no associated director is found' do
      expect(Movie.movies_with_same_director(fourth).select(:id).ids).to eq([])
    end

    it 'returns empty array when movie has no director' do
      expect(Movie.movies_with_same_director(third).select(:id).ids).to eq([])
    end
  end

  describe ".get_id_from_title" do
    it 'returns the id from a title' do
      expect(Movie.get_id_from_title('tst1').id).to eql(1)
    end
  end
end
