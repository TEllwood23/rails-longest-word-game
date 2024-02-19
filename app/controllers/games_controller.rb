require 'open-uri'

class GamesController < ApplicationController

  def new
    @letters = ('a'..'z').to_a.sample(7)
  end

  def score
    @word = params[:score]
    @valid_test = valid_word?(@word)
  end

  private

  def valid_word?(test_word)
    word_url = URI.open("https://wagon-dictionary.herokuapp.com/#{test_word}")
    json = JSON.parse(word_url.read)
    json['found']
  end

end
