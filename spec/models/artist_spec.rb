require 'rails_helper'

RSpec.describe Artist do
  it { should have_many :songs }

  describe 'instance methods' do
    describe '#average_song_length' do
      before :each do
        @prince = Artist.create!(name: 'Prince')
        @purple = @prince.songs.create!(title: 'Purple Rain', length: 800, play_count: 1233)
        @beret = @prince.songs.create!(title: 'Raspberry Beret', length: 353, play_count: 64543)
        @other_song = @prince.songs.create!(title: 'Another Prince Song', length: 1, play_count: 64543)
      end

      it 'returns the average song length' do
        expect(@prince.average_song_length.round(2)).to eq(384.67)
      end
    end
  end
end
