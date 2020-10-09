require_relative '../knight_dialer'

describe 'Knight Dialer' do

  context ' when you start from 5' do
    it 'dials only one number regardless of the hops' do
      hops = 10
      starting_number = 5

      result = KnightDialer.new(hops).count_dialble_numbers_from(starting_number)

      expect(result).to eq(1)
    end
  end

  context 'when you start from any number except 4 or 6' do
    context 'and there is not a 4 or 6 in the loop' do
      it 'dials 2 distinct numbers in 1 hops' do
        hops = 1
        starting_number = 2

        result = KnightDialer.new(hops).count_dialble_numbers_from(starting_number)

        expect(result).to eq(2)
      end

      it 'dials 4 distinct numbers in 2 hops' do
        hops = 2
        starting_number = 2

        result = KnightDialer.new(hops).count_dialble_numbers_from(starting_number)

        expect(result).to eq(4)
      end
    end

    context 'and there is a 4 or 6 in the loop' do
      it 'dials 5 distinct numbers in 2 hops' do
        hops = 2
        starting_number = 1

        result = KnightDialer.new(hops).count_dialble_numbers_from(starting_number)

        expect(result).to eq(5)
      end

      it 'dials 10 distinct numbers in 3 hops' do
        hops = 3
        starting_number = 2

        result = KnightDialer.new(hops).count_dialble_numbers_from(starting_number)

        expect(result).to eq(10)
      end

      it 'dials 10 distinct numbers in 4 hops' do
        hops = 4
        starting_number = 2

        result = KnightDialer.new(hops).count_dialble_numbers_from(starting_number)

        expect(result).to eq(20)
      end
    end
  end

  context 'when you start from 4 or 6' do
    it 'dials 3 distinct numbers in 1 hops' do
      hops = 1
      starting_number = 4

      result = KnightDialer.new(hops).count_dialble_numbers_from(starting_number)

      expect(result).to eq(3)
    end

    it 'dials 6 distinct numbers in 2 hops' do
      hops = 2
      starting_number = 4

      result = KnightDialer.new(hops).count_dialble_numbers_from(starting_number)

      expect(result).to eq(6)
    end
  end
end
