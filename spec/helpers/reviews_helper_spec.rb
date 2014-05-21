require 'spec_helper'

describe ReviewsHelper do

	context 'star_rating method' do

		it 'puts five black stars for rating of five' do
			expect(star_rating(5)).to eq "★★★★★"
		end

		it 'puts three white stars and two white starts for rating of three' do
			expect(star_rating(3)).to eq "★★★☆☆"
		end

		it 'rounds to the next star' do
			expect(star_rating(3.5)).to eq "★★★★☆"
		end

		it 'displays only number' do
			expect(star_rating('N/A')).to eq 'N/A'
		end

	end

end
