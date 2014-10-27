class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  layout false
  
  # Define the variables to be used on the view
  def index
    # Creates a new PDF document
    pdf = Prawn::Document.new :page_layout => :landscape, :margin => 0

    pdf.image "#{Rails.root}/public/triptab.jpg", :at  => [-20, pdf.cursor-10],
      :fit => [PDF::Core::PageGeometry::SIZES["A4"][1],
      PDF::Core::PageGeometry::SIZES["A4"][0]]


    pdf.font "Courier"
    
    pdf.font_size(60)
    pdf.text "ASSD23D23WEF23F2EW2", :align  => :center, :valign => :center

    pdf.font_size(40)
    pdf.fill_color "ffffff"
    pdf.text_box "24/11/2014",
      :align  => :center,
      :valign => :center,
      :at => [500, 90]

    pdf.text_box "24/11/2014",
      :align  => :center,
      :valign => :center,
      :at => [500, 205]

    pdf.start_new_page

    send_data pdf.render, :filename => "x.pdf", :type => "application/pdf", :disposition => 'inline'
  end

end
