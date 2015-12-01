class AperturaCajaPdf < Prawn::Document
  def initialize(apertura_caja, view)
    super(top_margin: 70)
    @apertura_caja = apertura_caja
    @view = view
    move_down(20)
    
    inicio_caja
    move_down(10)
    movimientos_caja
    move_down(10)
    cierre_caja

    repeat :all do
      #header
      #image "#{Rails.root}/public/#{Configuracion.first.logo_empresa}", height: 50, width: 500, at: [bounds.left, bounds.top+50]
      #footer
      number_pages "Usuario: #{@apertura_caja.user.username}", at: [bounds.left, -10]
      number_pages "Pag. <page> de <total>", at: [200,-10]
      number_pages "Impreso el #{Time.now}", at: [bounds.right-200,-10], width: 200, align: :right
    end

  end

  protected

  def inicio_caja
    text "Arqueo de Caja Nro. #{@apertura_caja.caja.nro_caja}", align: :center, size: 15, style: :bold
    move_down(5)
    text "Saldo inicial en Efectivo: #{price(@apertura_caja.saldo_inicial_efectivo)}", size: 10, style: :bold
    text "Saldo inicial en Cheque: #{price(@apertura_caja.saldo_inicial_cheque)}", size: 10, style: :bold
  end

  def cierre_caja
    text "Saldo final en Efectivo: #{price(@apertura_caja.saldo_final_efectivo)}", size: 10, style: :bold
    text "Saldo final en Cheque: #{price(@apertura_caja.saldo_final_cheque)}", size: 10, style: :bold
  end
  
  def movimientos_caja
    text "Movimientos de caja", align: :center, size: 12, style: :italic
    table movimiento_caja_rows do
      row(0).font_style = :bold 
      columns(0..6).align = :center
      self.cell_style = {:font => "Helvetica", :size => 10}
      self.header = true
      self.column_widths = [65, 140, 45]
    end
  end

  def movimiento_caja_rows
    [["Fecha", "Motivo","Tipo", "Monto"]] +
    @apertura_caja.movimiento_cajas.order(:fecha).map do |movimiento|
      [fecha_format(movimiento.fecha), motivo(movimiento), tipo(movimiento.es_ingreso), sub_monto(movimiento)]
    end
  end

  def sub_monto(movimiento)
    sub_data = sub_monto_rows(movimiento)
    make_table(sub_data) do
       self.cell_style = {:font => "Helvetica", :size => 10}
       self.column_widths = [225, 65]
       columns(1..2).align = :right
    end   
  end

  def sub_monto_rows(movimiento)
    if movimiento.monto_efectivo > 0
      [["Efectivo", price(movimiento.monto_efectivo)]]
    end +
    movimiento.cheque_recibidos.map do |cheque|
        ["Cheque Nro:#{cheque.nro_cheque}, Banco #{cheque.banco.nombre}, #{cheque.fecha}", price(cheque.monto)]
    end
  end

  def motivo(movimiento)
    "#{MotivoMovimientoCaja.find(movimiento.motivo_movimiento_caja_id).descripcion}, #{movimiento.descripcion}"
  end

  def tipo(tipo_id)
    if tipo_id
      "Ingreso"
    else
      "Egreso"
    end
  end

  def fecha_format(fecha)
    fecha.to_formatted_s(:db)
  end

  def price(num)
    @view.number_to_currency(num, :unit => "")
  end
  
end
