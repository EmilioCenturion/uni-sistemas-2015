class AuditoriaLogsController < ApplicationController
  def buscar
    tabla = params[:tabla];
    usuario = params[:usuario];
    fecha_inicio = params[:fecha_inicio];
    fecha_fin = params[:fecha_fin];
    @resultado = Audited::Adapters::ActiveRecord::Audit.all

    if tabla.present?
      @resultado = @resultado.where('auditable_type = (?)', tabla)
    end
    if usuario.present?
      @resultado = @resultado.where('user_id = (?)', usuario.to_i)
    end
       
    if fecha_inicio.present? and fecha_fin.present?
      fecha_inicio = Date.strptime(fecha_inicio, "%m/%d/%Y").to_datetime
      fecha_fin = Date.strptime(fecha_fin, "%m/%d/%Y").to_datetime.end_of_day
      @resultado = @resultado.where(created_at: [fecha_inicio..fecha_fin])
    end
    @resultado ||= []

    respond_to do |format|
      format.html
      format.json { render json: @auditoria_logs }
    end

  end
end