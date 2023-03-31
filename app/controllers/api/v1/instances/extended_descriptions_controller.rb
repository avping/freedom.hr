# frozen_string_literal: true

class Api::V1::Instances::ExtendedDescriptionsController < Api::BaseController
  skip_before_action :require_authenticated_user!, unless: :whitelist_mode?

  before_action :set_extended_description

  def show
    expires_in 5.minutes, public: true, stale_while_revalidate: 60.seconds, stale_if_error: 1.day
    render json: @extended_description, serializer: REST::ExtendedDescriptionSerializer
  end

  private

  def set_extended_description
    @extended_description = ExtendedDescription.current
  end
end
