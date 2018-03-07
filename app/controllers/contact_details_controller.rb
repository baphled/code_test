class ContactDetailsController < ApplicationController
  def new
    @contact_details = ContactDetails.new
  end
end
