# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

PeriodoFiscal.create(fecha_inicio: '2015-01-01', fecha_fin: '2015-12-31', anho: '2015', activo: 'true')
CuentaContable.create(tipo_cuenta: 'No imputable', nivel_cuenta: 1, codigo_cuenta: 1, descripcion: 'Activo')
CuentaContable.create(tipo_cuenta: 'No imputable', nivel_cuenta: 2, codigo_cuenta: 11, descripcion: 'Activo corriente')
CuentaContable.create(tipo_cuenta: 'No imputable', nivel_cuenta: 3, codigo_cuenta: 111, descripcion: 'Efectivo y otros medios liquidos')
CuentaContable.create(tipo_cuenta: 'No imputable', nivel_cuenta: 4, codigo_cuenta: 1111, descripcion: 'Caja')
CuentaContable.create(tipo_cuenta: 'Imputable', nivel_cuenta: 5, codigo_cuenta: 111101, descripcion: 'Efectivo')
CuentaContable.create(tipo_cuenta: 'Imputable', nivel_cuenta: 5, codigo_cuenta: 111102, descripcion: 'Recaudaciones por cobrar')
CuentaContable.create(tipo_cuenta: 'No imputable', nivel_cuenta: 4, codigo_cuenta: 1112, descripcion: 'Banco')
CuentaContable.create(tipo_cuenta: 'Imputable', nivel_cuenta: 5, codigo_cuenta: 111201, descripcion: 'Banco')