require 'open-uri'

class GamesController < ApplicationController

  def new
    @letters = ('a'..'z').to_a.sample(10)
  end

  def score
    @word = params[:score].split(" ")
    # @valid_test = valid_word?(@word)
    #   if @word == @valid_test
    #     @result = "correct"
    #   else
    #     @result = "Sorry but #{@word} doesn't seem to be a valid English word!"
    #   end


  end



  private

  def valid_word?(test_word)
    word_url = URI.open("https://wagon-dictionary.herokuapp.com/#{test_word}")
    json = JSON.parse(word_url.read)
    json['found']
  end


end
