class WelcomeController < ApplicationController
  def index
    @nums = gen_nums(9)
  end

  private

  def gen_nums(max)
    nums = Array.new(max)

    nums = nums.map.with_index do |n, index|
      [index, index]
    end

    nums.unshift(['-', nil])
    nums
  end
end
