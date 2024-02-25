class Task < ApplicationRecord
  with_options presence: true do
    validates :task
    validates :task_description
  end
end
