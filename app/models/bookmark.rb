class Bookmark < ApplicationRecord
  belongs_to :topic, optional: true
end
