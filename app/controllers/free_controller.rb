class FreeController < ApplicationController
  def index
  	@free_books = FreeEbook.order('created_at DESC')
  end
end
