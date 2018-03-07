require 'rails_helper'

RSpec.describe Customer do
  let(:auth_token) { '5bf520347a29d3e1a72898e01449120a' }
  let(:pGUID) { 'CFFBF53F-6D89-4B5B-8B36-67A97F18EDEB' }
  let(:pAccName) { 'MicDevtest' }
  let(:pPartner) { 'MicDevtest' }

  let(:name) { 'Joe Bloggs' }
  let(:business_name) { 'Some Business' }
  let(:telephone_number) { '0203 333 3333' }

  subject do
    described_class.new(
      auth_token: auth_token,
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
        auth_token: auth_token,
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

  describe '#save' do
    let(:email) { 'y@me.com' }
    let(:contact_name) { 'Joe Bloggs' }
    let(:notes) { 'My notes' }
    let(:reference) { 'My reference' }

    let(:params) do 
      {
        auth_token: auth_token,
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

    context 'invalid parameters' do
      it 'must have a auth token' do
        VCR.use_cassette 'POST without auth_token' do
          expect {
            params[:auth_token] = nil

            subject.post(:create, params)
          }.to raise_error(ActiveResource::UnauthorizedAccess)
        end
      end
    end
  end
end
