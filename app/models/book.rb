class Book < ApplicationRecord
  enum status: { backlog: 1, reading: 2, read: 3, dropped: 4 }, _default: :backlog
end
