migration 1, :create_families do
  up do
    create_table :families do
      column :id, Integer
      column :do_not_list, 'BOOLEAN'
      column :customized, 'BOOLEAN'
      column :last_name, String
      column :see_also_last_name_1, String
      column :see_also_last_name_2, String
      column :see_also_last_name_3, String
      column :see_also_last_name_4, String
      column :see_also_last_name_5, String
      column :see_also_last_name_6, String
      column :child_1_first_name, String, :length => 60
      column :child_1_grade, String
      column :child_2_first_name, String, :length => 60
      column :child_2_grade, String
      column :child_3_first_name, String, :length => 60
      column :child_3_grade, String
      column :child_4_first_name, String, :length => 60
      column :child_4_grade, String
      column :child_5_first_name, String, :length => 60
      column :child_5_grade, String
      column :home_1_mother_first, String
      column :home_1_mother_last, String
      column :home_1_father_first, String
      column :home_1_father_last, String
      column :home_1_street, String, :length => 60
      column :home_1_city, String
      column :home_1_zip, String
      column :home_1_mother_email, String, :length => 60
      column :home_1_father_email, String, :length => 60
      column :home_1_phone, String
      column :home_1_mother_work_phone, String
      column :home_1_father_work_phone, String
      column :home_1_mother_cell, String
      column :home_1_father_cell, String
      column :home_2_mother_first, String
      column :home_2_mother_last, String
      column :home_2_father_first, String
      column :home_2_father_last, String
      column :home_2_street, String, :length => 60
      column :home_2_city, String
      column :home_2_zip, String
      column :home_2_mother_email, String, :length => 60
      column :home_2_father_email, String, :length => 60
      column :home_2_phone, String
      column :home_2_mother_work_phone, String
      column :home_2_father_work_phone, String
      column :home_2_mother_cell, String
      column :home_2_father_cell, String
      column :created_at, DateTime
      column :updated_at, DateTime
    end
    create_index :families, :id, :unique => true
  end

  down do
    drop_table :families
  end
end
