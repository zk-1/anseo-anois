class InstagramAccountsController < ApplicationController
  before_action :insist_on_registered_user

  def form_fields
    respond_to do |format|
      format.turbo_stream
    end
  end
end
