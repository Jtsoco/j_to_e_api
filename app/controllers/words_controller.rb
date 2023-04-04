class WordsController < ApplicationController
  # this is my attempt to add authentification for the index of words
  # TODO decide whether to have bearer token in authorization header or query parameter

  def index
    authenticate(params[:bearer])
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

  private

  def authenticate(token)
    error!('401 Unauthorized', 401) unless ApiKey.where(token: token).present?
  end
end

# website/words?q=.....&bearer=....""
