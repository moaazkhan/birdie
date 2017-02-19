class Tweet
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :user

  field :content, type: String

  validates :content, presence: true
  validates_length_of :content, :maximum=>30
end
