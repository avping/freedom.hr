# frozen_string_literal: true

class Api::V2::InstancesController < Api::V1::InstancesController
  def show
    expires_in 5.minutes, public: true, stale_while_revalidate: 60.seconds, stale_if_error: 1.day
    render_with_cache json: InstancePresenter.new, serializer: REST::InstanceSerializer, root: 'instance'
  end
end
