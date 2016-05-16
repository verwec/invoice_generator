require 'prawn'
require 'prawn/measurement_extensions'
require_relative 'invoice_generator/version'
require_relative 'invoice_generator/invoice_template'

module InvoiceGenerator
  def self.generate_invoice(filename, params)
    pdf = InvoiceTemplate.new(params).build
    pdf.save_as(filename)
    pdf
  end
end
