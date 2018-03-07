class ContactDetails
  def self.post(params)
    begin
      Customer.new.post(:create, params)
    rescue ActiveResource::BadRequest => e
      JSON.parse(e.response.body)
    end
  end
end
