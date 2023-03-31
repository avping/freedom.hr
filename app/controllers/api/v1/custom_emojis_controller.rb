# frozen_string_literal: true

class Api::V1::CustomEmojisController < Api::BaseController
  def index
    expires_in 5.minutes, public: true, stale_while_revalidate: 60.seconds, stale_if_error: 1.day
    render_with_cache(each_serializer: REST::CustomEmojiSerializer) { CustomEmoji.listed.includes(:category) }
  end
end
