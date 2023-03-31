# frozen_string_literal: true

module ApiCachingConcern
  extend ActiveSupport::Concern

  def cache_if_unauthenticated!
    expires_in(15.seconds, public: true, stale_while_revalidate: 60.seconds, stale_if_error: 1.day) unless user_signed_in?
  end
end
