class Message < ApplicationRecord
    validates :content, presence: true, length: { maximum: 140 }#これにより無記入投稿とエンター長押しの連続投稿の2つが同時に防げる
    after_create_commit {MessageBroadcastJob.perform_later self}

    #データベースから要素を取得したときの、順序を指定するメソッド
    default_scope -> { order(:created_at) }

    belongs_to :user, optional: true
    belongs_to :room, optional: true
    validates :user_id, presence: true
end
