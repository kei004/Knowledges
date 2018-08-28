class Message < ApplicationRecord
    validates :content, presence: true #これにより無記入投稿とエンター長押しの連続投稿の2つが同時に防げる
    after_create_commit {MessageBroadcastJob.perform_later self}
    # こうしとくと誰が送ったか識別しやすいらしい
    belongs_to :user, optional: true
    belongs_to :room, optional: true
    belongs_to :table, optional: true
end
