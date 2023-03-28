class WordsController < ApplicationController
  def index
    @words = []
    if params[:q].present?
    params[:q].split.each do |word|
      full_word = Word.where("japanese = ?", word)
      # Empty checks if the word doesn't exist, nil? doesn't work
      full_word = Word.where("reading = ?", word) if full_word.empty?
      full_word = Word.where("english = ?", word) if full_word.empty?
      # TODO put error if word doesn't return what is wanted
      @words << full_word
    end
    else
      @words = Word.first(10)
    end
    # TODO change words later
    render json: {status: 'SUCCESS', message: 'Loaded words', data: @words}, status: :ok
  end
end
