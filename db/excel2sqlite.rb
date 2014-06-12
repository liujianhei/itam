require 'rubygems'
require 'spreadsheet'
require 'sqlite3'

computers = Spreadsheet.open 'computers.xls'
sheet7 = computers.worksheet 7
puts sheet7.row(1)[0]
db = SQLite3::Database.new "development.sqlite3"

models = []
sheet7.each do |row|
models << row[16]
end

models.uniq[1..8].each do |model|
db.execute "insert into models (name) values ( ? )", model
end

sas = []
sheet7.each do |row|
sas << row[8]
end

sas.uniq[1..7].each do |sa|
db.execute "insert into sas (name) values ( ? )", sa
end

switches = []
sheet7.each do |row|
switches << row[13]
end

switches.uniq[1..25].each do |switch|
db.execute "insert into switches (name) values ( ? )", switch
end

machine_cabinets = []
sheet7.each do |row|
machine_cabinets << row[18]
end

machine_cabinets.uniq[1..34].each do |machine_cabinet|
db.execute "insert into machine_cabinets (number) values ( ? )", machine_cabinet
end

locations = []
sheet7.each do |row|
locations << row[19]
end

locations.uniq[1..4].each do |location|
db.execute "insert into locations (name) values ( ? )", location
end


sheet7.each 2 do |row|
  asset_number = row[0]
  hardware_info = row[1]
  ip = row[3]
  idrac_ip = row[4]
  sa_id = (db.execute "select id from sas where name==?", row[8])[0][0].nil? ? 1 : (db.execute "select id from sas where name==?", row[8])[0][0]
  mac_addr = row[12]
  switch_id = (db.execute "select id from switches where name==?", row[13])[0][0].nil? ? 1 : (db.execute "select id from switches where name==?", row[13])[0][0]
  switch_port = row[14]
  model_id = (db.execute "select id from models where name==?", row[16])[0][0].nil? ? 1 : (db.execute "select id from models where name==?", row[16])[0][0]
  sn = row[17]
  machine_cabinet_id = (db.execute "select id from machine_cabinets where number==?", row[18])[0][0].nil? ? 1 : (db.execute "select id from machine_cabinets where number==?", row[18])[0][0]
  location_id = (db.execute "select id from locations where name==?", row[19])[0][0].nil? ? 1 : (db.execute "select id from locations where name==?", row[19])[0][0]
 
  puts asset_number, hardware_info, ip, idrac_ip, sa_id, mac_addr, switch_id, switch_port, model_id, sn, machine_cabinet_id, location_id
  
  db.execute("INSERT INTO computers (asset_number, hardware_info, ip, idrac_ip, sa_id, mac_addr, switch_id, switch_port, model_id, sn, machine_cabinet_id, location_id) 
            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [asset_number, hardware_info, ip, idrac_ip, sa_id, mac_addr, switch_id, switch_port, model_id, sn, machine_cabinet_id, location_id]) 
end
