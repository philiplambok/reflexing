# frozen_string_literal: true

class BookReflex < ApplicationReflex
  def update_status
    book = Book.find_by(id: element.dataset[:id])
    book.update(status: element[:value])
  end
end
