module InvoiceGenerator
  class InvoiceTemplate
    include Prawn::View

    attr_reader :params

    DEFAULT_LEADING = 2.5
    FONT_SIZE = 10
    DEFAULT_CITY = 'Berlin'.freeze
    FONT_PATH = File.expand_path '../../../lib/assets/fonts', __FILE__

    def initialize(params)
      @params = params
      format_document
    end

    def build
      date_block "#{DEFAULT_CITY}, #{date}"
      sender_address_line
      recipient_block
      main_block do
        subject_block
        body
      end
      footer
      self
    end

    private

    def date_block(content)
      bounding_box [250, 560], width: 270, height: 150 do
        text content, align: :right
      end
    end

    def sender_address_line
      bounding_box [20.mm, bounds.absolute_top - 35.mm],
        width: 100.mm, height: 8.mm do
        font_size FONT_SIZE-2 do
          text "#{sender_name}, #{sender_address}, #{sender_zipcode} #{sender_city}"
        end
      end
    end

    def recipient_block
      bounding_box [20.mm, bounds.absolute_top - 45.mm], width: 85.mm, height: 24.mm do
        text recipient_name
        text recipient_address
        text "#{recipient_zipcode} #{recipient_city}"
      end
    end

    def subject_block
      pad_bottom 15 do
        text subject, style: :bold
      end
    end

    def main_block(&block)
      bounding_box [20.mm, bounds.absolute_top - 105.mm], width: 175.mm, &block
    end

    def body
      pad(7) { text salutation }

      pad 7 do
        content = "vielen Dank für Ihre Bestellung vom #{order_date}. Anbei übersende ich Ihnen meine Rechnung mit der Bitte um Ausgleich."
        text content, inline_format: true
      end

      pad 7 do
        text "<b>#{order}</b>", inline_format: true
      end

      pad 7 do
        content = "Bitte überweisen Sie den Betrag in Höhe von #{total} #{payment_time} auf mein Konto bei der #{bank} mit dem Empfänger #{sender_name}, IBAN: #{sender_iban}, BIC: #{sender_bic} und dem Verwendungszweck <b>#{reference}</b>."
        text content, inline_format: true
      end

      pad 7 do
        text farewell, inline_format: true
        move_down 20
        text sender_name
      end
    end

    def footer
      font_size FONT_SIZE-2 do
        text_box "#{sender_name} | Steuernummer: #{sender_tax_number}", at: [20.mm, 20]
      end
    end

    def method_missing(method_name, *arguments, &block)
      if params[method_name.to_sym]
        params[method_name.to_sym]
      else
        super
      end
    end

    def format_document
      default_leading DEFAULT_LEADING
      font_size FONT_SIZE
      font_families.update 'DejaVuSans' => {
        normal: "#{FONT_PATH}/DejaVuSans.ttf",
        italic: "#{FONT_PATH}/DejaVuSans-Oblique.ttf",
        bold: "#{FONT_PATH}/DejaVuSans-Bold.ttf",
        bold_italic: "#{FONT_PATH}/DejaVuSans-BoldOblique.ttf"
      }
      font 'DejaVuSans'
    end
  end
end
