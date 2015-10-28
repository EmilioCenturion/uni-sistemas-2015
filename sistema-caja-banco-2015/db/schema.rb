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

ActiveRecord::Schema.define(version: 20151028232342) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "apertura_cajas", force: true do |t|
    t.integer  "caja_id"
    t.datetime "apertura"
    t.datetime "cierre"
    t.decimal  "saldo_inicial_efectivo"
    t.decimal  "saldo_inicial_cheque"
    t.decimal  "saldo_final_efectivo"
    t.decimal  "saldo_final_cheque"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "apertura_cajas", ["caja_id"], name: "index_apertura_cajas_on_caja_id", using: :btree
  add_index "apertura_cajas", ["user_id"], name: "index_apertura_cajas_on_user_id", using: :btree

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
    t.decimal  "monto_efectivo"
    t.decimal  "monto_cheque"
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
    t.decimal  "saldo_inicial_efectivo"
    t.decimal  "saldo_inicial_cheque"
    t.string   "estado"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cheque_emitidos", force: true do |t|
    t.integer  "nro_cheque"
    t.decimal  "monto"
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
    t.decimal  "monto"
    t.date     "fecha"
    t.string   "concepto"
    t.integer  "cliente_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cheque_recibidos", ["banco_id"], name: "index_cheque_recibidos_on_banco_id", using: :btree
  add_index "cheque_recibidos", ["cliente_id"], name: "index_cheque_recibidos_on_cliente_id", using: :btree

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
    t.decimal  "saldo"
    t.integer  "banco_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cuenta", ["banco_id"], name: "index_cuenta_on_banco_id", using: :btree

  create_table "cupon_emitidos", force: true do |t|
    t.integer  "nro_cupon"
    t.decimal  "monto"
    t.date     "fecha"
    t.integer  "tarjeta_id"
    t.string   "concepto"
    t.integer  "proveedor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cupon_emitidos", ["proveedor_id"], name: "index_cupon_emitidos_on_proveedor_id", using: :btree
  add_index "cupon_emitidos", ["tarjeta_id"], name: "index_cupon_emitidos_on_tarjeta_id", using: :btree

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
    t.decimal  "monto_efectivo"
    t.decimal  "monto_cheque"
    t.datetime "fecha"
    t.datetime "created_at"
    t.datetime "updated_at"
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
    t.decimal  "monto_efectivo"
    t.decimal  "monto_cheque"
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

end
