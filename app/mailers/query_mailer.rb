class QueryMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.query_mailer.new_query.subject
  #
  def creation_confirmation(query)
    @query = query
    mail to: @query.email, subject: "We're dealing with your query"
  end

  def creation_notification(query)
    @query = query
    mail to: "almazaheineken@gmail.com", subject: "Your website has recieved a new query"
  end


end