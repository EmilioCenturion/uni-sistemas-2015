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

ActiveRecord::Schema.define(version: 20151009003544) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bancos", force: true do |t|
    t.string   "nombre"
    t.string   "direccion"
    t.string   "telefono"
    t.string   "correo"
    t.integer  "pai_id"
    t.integer  "ciudad_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bancos", ["ciudad_id"], name: "index_bancos_on_ciudad_id", using: :btree
  add_index "bancos", ["pai_id"], name: "index_bancos_on_pai_id", using: :btree

  create_table "cajas", force: true do |t|
    t.integer  "nro_caja"
    t.datetime "apertura"
    t.datetime "cierre"
    t.decimal  "saldo_inicial_efectivo"
    t.decimal  "saldo_inicial_cheque"
    t.decimal  "saldo_final_efectivo"
    t.decimal  "saldo_final_cheque"
    t.integer  "usuario_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cajas", ["usuario_id"], name: "index_cajas_on_usuario_id", using: :btree

  create_table "cheque_emitidos", force: true do |t|
    t.integer  "nro_cheque"
    t.decimal  "monto"
    t.date     "fecha"
    t.integer  "chequera_id"
    t.string   "concepto"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cheque_emitidos", ["chequera_id"], name: "index_cheque_emitidos_on_chequera_id", using: :btree

  create_table "cheque_recibidos", force: true do |t|
    t.integer  "nro_cheque"
    t.integer  "banco_id"
    t.decimal  "monto"
    t.date     "fecha"
    t.string   "concepto"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cheque_recibidos", ["banco_id"], name: "index_cheque_recibidos_on_banco_id", using: :btree

  create_table "chequeras", force: true do |t|
    t.integer  "nro_primero"
    t.integer  "nro_ultimo"
    t.integer  "cuentum_id"
    t.integer  "personal_id"
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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cupon_emitidos", ["tarjeta_id"], name: "index_cupon_emitidos_on_tarjeta_id", using: :btree

  create_table "motivo_movimientos", force: true do |t|
    t.string   "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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
