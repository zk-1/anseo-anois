class MainController < ApplicationController
  # skip_before_action :require_authentication

  def index
    if share_code.present?
      @share_code.increment!(:hits)
      @account = share_code.share_code_protectable
      @sharable_view = true
      render template: "accounts/show"
    end
  end

  private

  def share_code
    return unless root_params[:sc].present?

    @share_code ||= ShareCode.find_by(code: root_params[:sc])
  end

  def root_params
    params.permit(:sc)
  end
end
