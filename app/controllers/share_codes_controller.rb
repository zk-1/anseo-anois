class ShareCodesController < ApplicationController
  include ActionView::RecordIdentifier
  before_action :insist_on_registered_user

  def new
    @share_code = current_user.owned_share_codes.new
  end

  def create
    @share_code = current_user.owned_share_codes.new(share_code_params)
    return render :unauthorized unless @share_code.share_code_protectable.owner == current_user

    if @share_code.save
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.append(dom_id(@share_code.share_code_protectable, :share_codes), @share_code)
        end
        format.html { redirect_to @share_code.share_code_protectable, notice: "Share code was successfully created." }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @share_code = current_user.owned_share_codes.find(params[:id])
  end

  def destroy
    @share_code = current_user.owned_share_codes.find(params[:id])
    @share_code.destroy

    redirect_to @share_code.share_code_protectable, notice: "Share code was successfully deleted."
  end

  private

  def share_code_params
    params.expect(share_code: [ :expires_at, :share_code_protectable_id, :share_code_protectable_type ])
  end
end
