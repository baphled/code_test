class ContactDetails
  include ActiveModel::Model

  # NOTE: Only real reason to use these validations is for simple_form.
  #
  # Duplicating validation is usually a code smell
  #
  validates_presence_of :name
  validates_presence_of :business_name
  validates_presence_of :telephone_number

  # Mandatory user input
  attr_accessor :access_token
  attr_accessor :pGUID
  attr_accessor :pPartner
  attr_accessor :pAccName

  # Optional user input
  attr_accessor :name
  attr_accessor :business_name
  attr_accessor :telephone_number
  attr_accessor :email
  attr_accessor :contact_time
  attr_accessor :notes
  attr_accessor :reference

  def self.post(params)
    begin
      response = Customer.new.post(:create, params)
      JSON.parse(response.body)
    rescue ActiveResource::UnauthorizedAccess, ActiveResource::BadRequest => e
      JSON.parse(e.response.body)
    end
  end
end
