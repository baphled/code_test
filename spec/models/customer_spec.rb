require 'rails_helper'

RSpec.describe Customer do
  let(:access_token) { '5bf520347a29d3e1a72898e01449120a' }
  let(:pGUID) { 'CFFBF53F-6D89-4B5B-8B36-67A97F18EDEB' }
  let(:pAccName) { 'MicDevtest' }
  let(:pPartner) { 'MicDevtest' }

  let(:name) { 'Joe Bloggs' }
  let(:business_name) { 'Some Business' }
  let(:telephone_number) { '0203 333 3333' }

  subject do
    described_class.new(
      access_token: access_token,
      pGUID: pGUID,
      pAccName: pAccName,
      pPartner: pPartner,
      name: name,
      business_name: business_name,
      telephone_number: telephone_number,
    )
  end

  describe '#new' do
    subject do 
      described_class.new(
        access_token: access_token,
        pGUID: pGUID,
        pAccName: pAccName,
        pPartner: pPartner,
        name: name,
        business_name: business_name,
        telephone_number: telephone_number,
        email: email,
        contact_name: contact_name,
        notes: notes,
        reference: reference,
      )
    end

    let(:business_name) { 'Some Business' }
    let(:telephone_number) { '0203 333 3333' }
    let(:email) { 'y@me.com' }
    let(:contact_name) { 'Joe Bloggs' }
    let(:notes) { 'My notes' }
    let(:reference) { 'My reference' }

    it 'has a name' do
      expect(subject.name).to eql(name)
    end

    it 'has a business name' do
      expect(subject.business_name).to eql(business_name)
    end

    it 'has a telephone number' do
      expect(subject.telephone_number).to eql(telephone_number)
    end

    it 'has a email' do
      expect(subject.email).to eql(email)
    end

    it 'has a contact name' do
      expect(subject.contact_name).to eql(contact_name)
    end

    it 'has a reference' do
      expect(subject.reference).to eql(reference)
    end

    it 'has a notes' do
      expect(subject.notes).to eql(notes)
    end
  end

  describe '#post' do
    let(:email) { 'y@me.com' }
    let(:contact_name) { 'Joe Bloggs' }
    let(:notes) { 'My notes' }
    let(:reference) { 'My reference' }

    let(:params) do 
      {
        access_token: access_token,
        pGUID: pGUID,
        pAccName: pAccName,
        pPartner: pPartner,
        name: name,
        business_name: business_name,
        telephone_number: telephone_number,
        email: email,
        contact_name: contact_name,
        notes: notes,
        reference: reference,
      }
    end

    let(:expected) do
      {
        message: 'Enqueue success',
        errors: []
      }
    end

    subject { described_class.new(params) }

    it 'can handle a successful request' do
      VCR.use_cassette 'POST with correct params' do
        expect(subject.post(:create, params).body).to eql(JSON.generate(expected))
      end
    end

    context 'access token not passed' do
      let(:access_token) { nil }
      subject { described_class.new }

      it 'must have a access token' do
        VCR.use_cassette 'POST without access_token' do
          expect {
            subject.post(:create, params)
          }.to raise_error(ActiveResource::UnauthorizedAccess)
        end
      end
    end

    context 'pGUID not passed' do
      let(:pGUID) { nil }
      let(:expected) do
        {
          message: 'Format errors on validation',
          errors: [
            "Field 'pGUID' is blank",
            "Field 'pGUID' wrong format"
          ]
        }
      end

      subject { described_class.new }

      it 'must have a pGUID' do
        VCR.use_cassette 'POST without pGUID' do
          expect {
            subject.post(:create, params)
          }.to raise_error(ActiveResource::BadRequest)
        end
      end

      it 'has access to the request errors' do
        VCR.use_cassette 'POST without pGUID' do
          begin
            subject.post(:create, params)
          rescue ActiveResource::BadRequest => e
            expect(e.response.body).to eql(JSON.generate(expected))
          end
        end
      end
    end

    context 'pAccName not passed' do
      let(:pAccName) { nil }
      subject { described_class.new }

      it 'must have a pAccName' do
        VCR.use_cassette 'POST without pAccName' do
          expect {
            subject.post(:create, params)
          }.to raise_error(ActiveResource::BadRequest)
        end
      end
    end
  end
end
