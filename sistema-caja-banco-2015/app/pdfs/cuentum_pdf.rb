class CuentumPdf < Prawn::Document
  def initialize(cuentum, view)
    super(top_margin: 70)
    @cuentum = cuentum
    @fecha = Time.now
    @movimientos= MovimientoBanco.where(:cuenta_id => cuentum.id, :fecha => @fecha.beginning_of_day..@fecha.end_of_day)
    move_down(20)

    
    unless @movimientos.empty?
      inicio_cuenta
      move_down(10)
      movimientos_banco
      move_down(10)
      cierre_cuenta
    else
      sin_movimientos
    end
    

    repeat :all do
      #header
      image "#{Rails.root}/cabecera.jpg", height: 50, width: 500, at: [bounds.left, bounds.top+50]
      #footer
      number_pages "Usuario: xxxx", at: [bounds.left, -10]
      number_pages "Pag. <page> de <total>", at: [200,-10]
      number_pages "Impreso el #{Time.now}", at: [bounds.right-200,-10], width: 200, align: :right
    end

  end

  protected

  def sin_movimientos
    text "Arqueo de Cuenta Nro. #{@cuentum.nro_cuenta}", align: :center, size: 15, style: :bold
    move_down(15)
    text "Sin Movimientos el dia #{fecha_format(@fecha)} - Saldo: #{@cuentum.saldo}", align: :center, size: 12, style: :bold    
  end

  def inicio_cuenta
    text "Arqueo de Cuenta Nro. #{@cuentum.nro_cuenta}", align: :center, size: 15, style: :bold
    move_down(5)
    text "Saldo inicial: #{@movimientos.first.saldo_inicial}", size: 10, style: :bold
  end

  def cierre_cuenta
    ultimo = @movimientos.last
    saldo = ultimo.saldo_inicial + ultimo.monto_efectivo + ultimo.monto_cheque
    text "Saldo final: #{saldo}", size: 10, style: :bold
  end
  
  def movimientos_banco
    text "Movimientos de banco", align: :center, size: 12, style: :italic
    table movimiento_banco_rows do
      row(0).font_style = :bold 
      columns(0..6).align = :center
      self.cell_style = {:font => "Helvetica", :size => 10}
      self.header = true
      self.column_widths = [65, 140, 45]
    end
  end

  def movimiento_banco_rows
    [["Fecha", "Motivo","Tipo", "Monto"]] +
    @movimientos.map do |movimiento|
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
      [["Efectivo", movimiento.monto_efectivo]]
    end +
    movimiento.movimiento_banco_detalles.map do |detalle|
        cheque = ChequeRecibido.find(detalle.cheque_recibido_id)
        ["Cheque Nro:#{cheque.nro_cheque}, Banco #{cheque.banco.nombre}, #{cheque.fecha}", cheque.monto]
    end
  end

  def motivo(movimiento)
    "#{MotivoMovimientoBanco.find(movimiento.motivo_movimiento_banco_id).descripcion}, #{movimiento.descripcion}"
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
