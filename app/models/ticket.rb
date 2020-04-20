class Ticket < ApplicationRecord
  enum status: { created: 0, blocked: 1, in_progress: 2, fixed: 3 }
end
