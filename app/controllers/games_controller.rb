require 'open-uri'

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
    @letters = params[:letters]
    @word = (params[:word] || '').upcase
    @included = included?(@word, @letters)
    @english_word = english_word?(@word)
  end

  private

  def included?(word, letters)
    word.chars.all? { |letter| word.count(letter) <= letters.count(letter) }
  end

  def english_word?(word)
    response = URI.open("https://wagon-dictionary.herokuapp.com/#{word}")
    json = JSON.parse(response.read)
    json['found']
  end
end
