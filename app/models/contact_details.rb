class ContactDetails
  include ActiveModel::Model

  attr_accessor :access_token
  attr_accessor :pGUID
  attr_accessor :pPartner
  attr_accessor :pAccName

  attr_accessor :name
  attr_accessor :business_name
  attr_accessor :telephone_number
  attr_accessor :email
  attr_accessor :contact_time
  attr_accessor :notes
  attr_accessor :reference

  def self.post(params)
    begin
      Customer.new.post(:create, params)
    rescue ActiveResource::BadRequest => e
      JSON.parse(e.response.body)
    end
  end
end
