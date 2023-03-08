class TagSearchesController < ApplicationController

  def tag_search
    @model = Book #search機能とは関係なし
    @word = params[:word]
    @books = Book.where("tag LIKE?","%#{@word}%")
    render "tag_searches/tag_search"
  end
end
