require 'spec_helper'
require 'pdf/inspector'

describe InvoiceGenerator do
  describe '.generate_invoice' do
    let(:params) do
      {
        date: '01.01.2015',
        subject: 'Ihre Rechnung vom 23.03.2015',
        sender_name: 'Bob Miller',
        sender_address: 'FooStreet 1',
        sender_zipcode: '12455',
        sender_city: 'Berlin',
        recipient_name: 'Peter Foo',
        recipient_address: 'FooStreet 1',
        recipient_zipcode: '12455',
        recipient_city: 'Berlin',
        order_date: '01.01.2015',
        total: '100 EUR',
        bank: 'FooBank',
        sender_iban: 'DE1234567',
        sender_bic: 'DE1234567',
        reference: '123456',
        order: 'Fancy Product Description',
        sender_commercial_register_number: '55555',
        sender_district_court: 'Finanzamt Berlin',
        sender_tax_number: '123453245',
        salutation: 'Sehr geehrte Damen und Herren,',
        farewell: 'Viele Grüsse'
      }
    end

    let(:rendered_pdf) do
      InvoiceGenerator.generate_invoice('test.pdf', params).render
    end

    let(:text_analysis) do
      PDF::Inspector::Text.analyze(rendered_pdf).strings.join('  ')
    end

    it 'includes all params' do
      params.each_pair do |_key, value|
        expect(text_analysis).to include(value)
      end
    end
  end
end
