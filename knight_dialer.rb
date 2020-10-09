class KnightDialer
  NUMBERS_LINK = {
    '1' => [6,8],
    '2' => [7,9],
    '3' => [4,8],
    '4' => [0,3,9],
    '5' => [],
    '6' => [0,1,7],
    '7' => [2,6],
    '8' => [1,3],
    '9' => [2,4],
    '0' => [4,6]
  }

  def initialize(hops)
    @hops = hops
    @dialble_chains_last_numbers = []
  end

  def count_dialble_numbers_from(starting_number)
    @dialble_chains_last_numbers << starting_number
    @hops.times do
      break if without_links?(starting_number)

      collect_dialble_chains_last_numbers
    end
    @dialble_chains_last_numbers.count
  end

  private

  def collect_dialble_chains_last_numbers
    previous_numbers = @dialble_chains_last_numbers.dup

    @dialble_chains_last_numbers.each do |number|
      dialble_linked_numbers = @dialble_chains_last_numbers.dup.concat(NUMBERS_LINK[number.to_s])
      @dialble_chains_last_numbers = dialble_linked_numbers - previous_numbers
    end
  end

  def without_links?(number)
    NUMBERS_LINK[number.to_s].empty?
  end
end