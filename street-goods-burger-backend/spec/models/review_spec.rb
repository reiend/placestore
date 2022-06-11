require 'rails_helper'

RSpec.describe "Review's Model", type: :model do
  let(:review) do
    Review.new(
      text_body: 'Lorem ipsum',
      reviewer: Faker::Name.first_name
    )
  end

  describe 'Associations' do
    it '1, should belongs_to food' do
      review = Review.reflect_on_association(:food)
      expect(review.macro).to eq(:belongs_to)
    end
  end

  describe 'Attributes' do
    describe 'comment' do
      it '1, must be a string' do
        expect(review.text_body).to be_a String
      end
      it '2, must be not nil' do
        expect(review.text_body).to_not be_nil
      end

      it '3, must be greater than 0 and less than 257' do
        expect(review.text_body.length).to (be >= 1).and(be <= 256)
      end
    end

    describe 'reviewer' do
      it '1, must be a string' do
        expect(review.reviewer).to be_a String
      end
      it '2, must be not nil' do
        expect(review.reviewer).to_not be_nil
      end

      it '3, must be greater than 0 and less than 65' do
        expect(review.reviewer.length).to (be >= 1).and(be <= 64)
      end
    end
  end
end
