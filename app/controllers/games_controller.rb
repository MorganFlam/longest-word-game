class GamesController < ApplicationController
  def new
    @new_game = []
    letters = "abcdefghijklmnopqrstuvwxyz"

    10.times do
      r = rand 0..25
      @new_game << letters[r].capitalize
    end
  end

  def score
  end
end
