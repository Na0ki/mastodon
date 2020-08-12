# frozen_string_literal: true

class Regret < ApplicationRecord
  belongs_to :user

  validates :body, presence: true, length: { in: 100..4000 }
end
