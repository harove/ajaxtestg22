class ClaimsController < ApplicationController
  def create
    @claim = Claim.new(
      content: params[:claim][:content],
      company: Company.find(params[:company_id]),
      user: current_user
    )
    @claim.save
    respond_to :js
  end
end
