# frozen_string_literal: true

class Api::V1::InstancesController < Api::BaseController
  skip_before_action :require_authenticated_user!, unless: :whitelist_mode?

  def show
    expires_in 5.minutes, public: true, stale_while_revalidate: 60.seconds, stale_if_error: 1.day
    render_with_cache json: InstancePresenter.new, serializer: REST::V1::InstanceSerializer, root: 'instance'
  end
end
