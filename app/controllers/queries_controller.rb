class QueriesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :create ]


  def create
    @query = Query.new(query_params)
    authorize @query
    if @query.save
      QueryMailer.creation_confirmation(@query).deliver_now
      QueryMailer.creation_notification(@query).deliver_now
      redirect_to root_path
    else
      flash[:danger] = @query.errors.full_messages.join(', ')
    end
  end




  def query_params
    params.require(:query).permit(:name, :email, :message)
  end


end
