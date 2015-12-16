# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20151201195625) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "apertura_cajas", force: true do |t|
    t.integer  "caja_id"
    t.datetime "apertura"
    t.datetime "cierre"
    t.decimal  "saldo_inicial_efectivo", default: 0.0
    t.decimal  "saldo_inicial_cheque",   default: 0.0
    t.decimal  "saldo_final_efectivo",   default: 0.0
    t.decimal  "saldo_final_cheque",     default: 0.0
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "apertura_cajas", ["caja_id"], name: "index_apertura_cajas_on_caja_id", using: :btree
  add_index "apertura_cajas", ["user_id"], name: "index_apertura_cajas_on_user_id", using: :btree

  create_table "audits", force: true do |t|
    t.integer  "auditable_id"
    t.string   "auditable_type"
    t.integer  "associated_id"
    t.string   "associated_type"
    t.integer  "user_id"
    t.string   "user_type"
    t.string   "username"
    t.string   "action"
    t.text     "audited_changes"
    t.integer  "version",         default: 0
    t.string   "comment"
    t.string   "remote_address"
    t.string   "request_uuid"
    t.datetime "created_at"
  end

  add_index "audits", ["associated_id", "associated_type"], name: "associated_index", using: :btree
  add_index "audits", ["auditable_id", "auditable_type"], name: "auditable_index", using: :btree
  add_index "audits", ["created_at"], name: "index_audits_on_created_at", using: :btree
  add_index "audits", ["request_uuid"], name: "index_audits_on_request_uuid", using: :btree
  add_index "audits", ["user_id", "user_type"], name: "user_index", using: :btree

  create_table "bancos", force: true do |t|
    t.string   "nombre"
    t.string   "direccion"
    t.string   "telefono"
    t.string   "correo"
    t.string   "sucursal"
    t.integer  "pai_id"
    t.integer  "ciudad_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bancos", ["ciudad_id"], name: "index_bancos_on_ciudad_id", using: :btree
  add_index "bancos", ["pai_id"], name: "index_bancos_on_pai_id", using: :btree

  create_table "boleta_deposito_detalles", force: true do |t|
    t.integer  "boleta_deposito_id"
    t.integer  "cheque_recibido_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "boleta_deposito_detalles", ["boleta_deposito_id"], name: "index_boleta_deposito_detalles_on_boleta_deposito_id", using: :btree
  add_index "boleta_deposito_detalles", ["cheque_recibido_id"], name: "index_boleta_deposito_detalles_on_cheque_recibido_id", using: :btree

  create_table "boleta_depositos", force: true do |t|
    t.integer  "nro_boleta"
    t.decimal  "monto_efectivo",   default: 0.0
    t.decimal  "monto_cheque",     default: 0.0
    t.date     "fecha"
    t.integer  "cuenta_id"
    t.integer  "apertura_caja_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "boleta_depositos", ["apertura_caja_id"], name: "index_boleta_depositos_on_apertura_caja_id", using: :btree
  add_index "boleta_depositos", ["cuenta_id"], name: "index_boleta_depositos_on_cuenta_id", using: :btree

  create_table "cajas", force: true do |t|
    t.integer  "nro_caja"
    t.decimal  "saldo_inicial_efectivo", default: 0.0
    t.decimal  "saldo_inicial_cheque",   default: 0.0
    t.string   "estado",                 default: "Cerrado"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cheque_emitidos", force: true do |t|
    t.integer  "nro_cheque"
    t.decimal  "monto",        default: 0.0
    t.date     "fecha"
    t.integer  "chequera_id"
    t.integer  "proveedor_id"
    t.string   "concepto"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cheque_emitidos", ["chequera_id"], name: "index_cheque_emitidos_on_chequera_id", using: :btree
  add_index "cheque_emitidos", ["proveedor_id"], name: "index_cheque_emitidos_on_proveedor_id", using: :btree

  create_table "cheque_recibidos", force: true do |t|
    t.integer  "nro_cheque"
    t.integer  "banco_id"
    t.decimal  "monto",              default: 0.0
    t.date     "fecha"
    t.string   "concepto"
    t.integer  "cliente_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "movimiento_caja_id"
    t.boolean  "depositado"
  end

  add_index "cheque_recibidos", ["banco_id"], name: "index_cheque_recibidos_on_banco_id", using: :btree
  add_index "cheque_recibidos", ["cliente_id"], name: "index_cheque_recibidos_on_cliente_id", using: :btree
  add_index "cheque_recibidos", ["movimiento_caja_id"], name: "index_cheque_recibidos_on_movimiento_caja_id", using: :btree

  create_table "chequeras", force: true do |t|
    t.integer  "nro_primero"
    t.integer  "nro_ultimo"
    t.integer  "cuentum_id"
    t.integer  "personal_id"
    t.string   "estado"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "chequeras", ["cuentum_id"], name: "index_chequeras_on_cuentum_id", using: :btree
  add_index "chequeras", ["personal_id"], name: "index_chequeras_on_personal_id", using: :btree

  create_table "ciudads", force: true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clientes", force: true do |t|
    t.string   "nombre"
    t.string   "representante"
    t.string   "ruc"
    t.integer  "telefono"
    t.string   "email"
    t.string   "direccion"
    t.integer  "pai_id"
    t.integer  "ciudad_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "clientes", ["ciudad_id"], name: "index_clientes_on_ciudad_id", using: :btree
  add_index "clientes", ["pai_id"], name: "index_clientes_on_pai_id", using: :btree

  create_table "configuracions", force: true do |t|
    t.string   "nombre_empresa"
    t.string   "direccion"
    t.string   "correo"
    t.string   "telefono"
    t.string   "logo_empresa"
    t.integer  "tiempo_espera"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "cabecera_impresion"
  end

  create_table "credits", force: true do |t|
    t.integer  "nro_tarjeta"
    t.integer  "cuentum_id"
    t.integer  "personal_id"
    t.string   "estado"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "credits", ["cuentum_id"], name: "index_credits_on_cuentum_id", using: :btree
  add_index "credits", ["personal_id"], name: "index_credits_on_personal_id", using: :btree

  create_table "cuenta", force: true do |t|
    t.integer  "nro_cuenta"
    t.decimal  "saldo",      default: 0.0
    t.integer  "banco_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cuenta", ["banco_id"], name: "index_cuenta_on_banco_id", using: :btree

  create_table "cuenta_contables", force: true do |t|
    t.string   "tipo_cuenta"
    t.integer  "nivel_cuenta"
    t.integer  "codigo_cuenta"
    t.string   "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cupon_emitidos", force: true do |t|
    t.integer  "nro_cupon"
    t.decimal  "monto",        default: 0.0
    t.date     "fecha"
    t.integer  "tarjeta_id"
    t.string   "concepto"
    t.integer  "proveedor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cupon_emitidos", ["proveedor_id"], name: "index_cupon_emitidos_on_proveedor_id", using: :btree
  add_index "cupon_emitidos", ["tarjeta_id"], name: "index_cupon_emitidos_on_tarjeta_id", using: :btree

  create_table "libro_bancos", force: true do |t|
    t.integer  "cuenta_id"
    t.date     "fecha_inicio"
    t.date     "fecha_fin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "libro_bancos", ["cuenta_id"], name: "index_libro_bancos_on_cuenta_id", using: :btree

  create_table "motivo_movimiento_bancos", force: true do |t|
    t.string   "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "motivo_movimiento_cajas", force: true do |t|
    t.string   "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "movimiento_banco_detalles", force: true do |t|
    t.integer  "movimiento_banco_id"
    t.integer  "cheque_recibido_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "movimiento_banco_detalles", ["cheque_recibido_id"], name: "index_movimiento_banco_detalles_on_cheque_recibido_id", using: :btree
  add_index "movimiento_banco_detalles", ["movimiento_banco_id"], name: "index_movimiento_banco_detalles_on_movimiento_banco_id", using: :btree

  create_table "movimiento_bancos", force: true do |t|
    t.integer  "cuenta_id"
    t.integer  "motivo_movimiento_banco_id"
    t.string   "descripcion"
    t.boolean  "es_ingreso"
    t.decimal  "monto_efectivo",             default: 0.0
    t.decimal  "monto_cheque",               default: 0.0
    t.datetime "fecha"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "saldo_inicial"
  end

  add_index "movimiento_bancos", ["cuenta_id"], name: "index_movimiento_bancos_on_cuenta_id", using: :btree
  add_index "movimiento_bancos", ["motivo_movimiento_banco_id"], name: "index_movimiento_bancos_on_motivo_movimiento_banco_id", using: :btree

  create_table "movimiento_caja_detalles", force: true do |t|
    t.integer  "movimiento_caja_id"
    t.integer  "cheque_recibido_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "movimiento_caja_detalles", ["cheque_recibido_id"], name: "index_movimiento_caja_detalles_on_cheque_recibido_id", using: :btree
  add_index "movimiento_caja_detalles", ["movimiento_caja_id"], name: "index_movimiento_caja_detalles_on_movimiento_caja_id", using: :btree

  create_table "movimiento_cajas", force: true do |t|
    t.integer  "apertura_caja_id"
    t.integer  "motivo_movimiento_caja_id"
    t.string   "descripcion"
    t.boolean  "es_ingreso"
    t.decimal  "monto_efectivo",            default: 0.0
    t.decimal  "monto_cheque",              default: 0.0
    t.datetime "fecha"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "movimiento_cajas", ["apertura_caja_id"], name: "index_movimiento_cajas_on_apertura_caja_id", using: :btree
  add_index "movimiento_cajas", ["motivo_movimiento_caja_id"], name: "index_movimiento_cajas_on_motivo_movimiento_caja_id", using: :btree

  create_table "pais", force: true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "periodo_fiscals", force: true do |t|
    t.date     "fecha_inicio"
    t.date     "fecha_fin"
    t.string   "anho"
    t.boolean  "activo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "personals", force: true do |t|
    t.string   "nombre"
    t.integer  "documento"
    t.integer  "telefono"
    t.string   "email"
    t.string   "direccion"
    t.integer  "pai_id"
    t.integer  "ciudad_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "personals", ["ciudad_id"], name: "index_personals_on_ciudad_id", using: :btree
  add_index "personals", ["pai_id"], name: "index_personals_on_pai_id", using: :btree

  create_table "proveedors", force: true do |t|
    t.string   "nombre"
    t.string   "representante"
    t.string   "ruc"
    t.string   "direccion"
    t.integer  "telefono"
    t.integer  "ciudad_id"
    t.integer  "pai_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "proveedors", ["ciudad_id"], name: "index_proveedors_on_ciudad_id", using: :btree
  add_index "proveedors", ["pai_id"], name: "index_proveedors_on_pai_id", using: :btree

  create_table "saldo_cuenta", force: true do |t|
    t.decimal  "saldo_debe"
    t.decimal  "saldo_haber"
    t.date     "fecha"
    t.integer  "cuenta_contable_id"
    t.integer  "periodo_fiscal_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "saldo_cuenta", ["cuenta_contable_id"], name: "index_saldo_cuenta_on_cuenta_contable_id", using: :btree
  add_index "saldo_cuenta", ["periodo_fiscal_id"], name: "index_saldo_cuenta_on_periodo_fiscal_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "username"
    t.string   "apellido"
    t.integer  "numero_ci"
    t.integer  "ciudad_id"
    t.integer  "pai_id"
    t.string   "telefono"
    t.string   "celular"
    t.string   "direccion"
    t.string   "estado"
    t.integer  "roles_mask"
  end

  add_index "users", ["ciudad_id"], name: "index_users_on_ciudad_id", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["pai_id"], name: "index_users_on_pai_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
