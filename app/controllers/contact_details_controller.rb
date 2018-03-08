class ContactDetailsController < ApplicationController
  def new
    @contact_details = ContactDetails.new
  end

  def create
    @contact_details = ContactDetails.new(contact_details_params)
    @response = ContactDetails.post(contact_details_params.merge(auth_params))

    render :new
  end

  private

  def contact_details_params
    params
      .require(:contact_details)
      .permit(
        :name,
        :business_name,
        :telephone_number,
        :email,
        :contact_time,
        :notes,
        :reference
    )
  end

  #
  # NOTE: Ideally these should be aprt of the API headers and not passed as part of the main payload. So we keep them
  # seperate for to make it clear they are used for authentication and authorisation.
  #
  def auth_params
    {
      access_token: ENV['LEAD_API_ACCESS_TOKEN'],
      pGUID: ENV['LEAD_API_PGUID'],
      pAccName: ENV['LEAD_API_PACCNAME'],
      pPartner: ENV['LEAD_API_PPARTNER']
    }
  end
end
