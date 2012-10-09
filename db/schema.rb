ActiveRecord::Schema.define(:version => 20121008222810) do

  create_table "animals", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end
end  

ActiveRecord::Schema.define(:version => 20121005153249) do


  create_table "owners", :force => true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "address"
    t.string   "city"
    t.string   "country"
    t.string   "email"
    t.string   "phone"
    t.boolean  "active"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end


  create_table "pets", :force => true do |t|
    t.integer  "animal_id"
    t.integer  "owner_id"
    t.string   "name"
    t.boolean  "female"
    t.date     "date_of_birth"
    t.boolean  "active"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end
end