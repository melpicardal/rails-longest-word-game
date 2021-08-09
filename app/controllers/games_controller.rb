require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def home
  end

  def new
    @letters = ('A'..'Z').to_a.sample(10)
    session[:score] = 0 if session[:score].nil?
  end

  def score
    @word = params[:word].upcase
    @letters = params[:letters].split
    @result = valid_word?(@word)
    @included = is_included?(@word)
    session[:score] = session[:score] + @word.length if @result && @included

  end

  private

  def valid_word?(word)
    url = "https://wagon-dictionary.herokuapp.com/#{word}"
    json = open(url).read
    @results = JSON.parse(json)
    @results['found']
  end

  def is_included?(word)
    word.chars.all? { |letter| @letters.count(letter) >= word.chars.count(letter) }
  end
end
