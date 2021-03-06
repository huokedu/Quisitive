class Question < ActiveRecord::Base
  validates :body, :author_id, presence: true

  belongs_to(
    :author,
    class_name: "User",
    foreign_key: :author_id,
    primary_key: :id
  )

  has_many(
    :answers,
    class_name: "Answer",
    foreign_key: :question_id,
    primary_key: :id
  )

  has_many :comments, as: :commentable

  has_many :topic_taggings

  has_many(
    :topics,
    through: :topic_taggings,
    source: :topic
  )

  has_many(:follows, as: :followable)

  has_many(:followers,
  through: :follows,
  source: :follower
  )



end
