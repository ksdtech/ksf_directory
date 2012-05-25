class Family
  include DataMapper::Resource
  
  @@custom_fields = { }
  
  NEXT_YEAR_DATE = '2011/08/01'
  
  PARENT_ATTRS = [
    :home_1_mother_first,
    :home_1_mother_last,
    :home_1_father_first,
    :home_1_father_last,
    :home_1_street,
    :home_1_city,
    :home_1_zip,
    :home_1_mother_email,
    :home_1_father_email,
    :home_1_phone,
    :home_1_mother_work_phone,
    :home_1_father_work_phone,
    :home_1_mother_cell,
    :home_1_father_cell,
    :home_2_mother_first,
    :home_2_mother_last,
    :home_2_father_first,
    :home_2_father_last,
    :home_2_street,
    :home_2_city,
    :home_2_zip,
    :home_2_mother_email,
    :home_2_father_email,
    :home_2_phone,
    :home_2_mother_work_phone,
    :home_2_father_work_phone,
    :home_2_mother_cell,
    :home_2_father_cell 
  ]
  
  PARENT_LAST_NAMES = [
    :home_1_mother_last,
    :home_1_father_last,
    :home_2_mother_last,
    :home_2_father_last
  ]
  
  SEE_ALSO_NAMES = [
    :see_also_last_name_1,
    :see_also_last_name_2,
    :see_also_last_name_3,
    :see_also_last_name_4,
    :see_also_last_name_5,
    :see_also_last_name_6
  ]

  ALL_FAMILIES_QUERY = %{ SELECT st.ID,
  h1id.Value    AS family_id
  FROM Students st
  LEFT OUTER JOIN CustomText h1id ON (h1id.FieldNo={{Home_ID}} AND h1id.KeyNo=st.DCID)
  WHERE (st.Enroll_Status<=0) }
  
  FAMILY_QUERY = %{ SELECT st.ID,
  st.First_Name,
  st.Last_Name,
  st.Grade_Level,
  st.EntryDate,
  h1id.Value    AS family_id,
  h1mf.Value    AS home_1_mother_first,
  st.Mother     AS home_1_mother_last,
  h1ff.Value    AS home_1_father_first,
  st.Father     AS home_1_father_last,
  st.Street     AS home_1_street,
  st.City       AS home_1_city,
  st.Zip        AS home_1_zip,
  h1me.Value    AS home_1_mother_email,
  h1fe.Value    AS home_1_father_email,
  st.Home_Phone AS home_1_phone,
  h1mw.Value    AS home_1_mother_work_phone,
  h1fw.Value    AS home_1_father_work_phone,
  h1mc.Value    AS home_1_mother_cell,
  h1fc.Value    AS home_1_father_cell,
  h2mf.Value    AS home_2_mother_first,
  h2ml.Value    AS home_2_mother_last,
  h2ff.Value    AS home_2_father_first,
  h2fl.Value    AS home_2_father_last,
  h2s.Value     AS home_2_street,
  h2c.Value     AS home_2_city,
  h2z.Value     AS home_2_zip,
  h2me.Value    AS home_2_mother_email,
  h2fe.Value    AS home_2_father_email,
  h2p.Value     AS home_2_phone,
  h2mw.Value    AS home_2_mother_work_phone,
  h2fw.Value    AS home_2_father_work_phone,
  h2mc.Value    AS home_2_mother_cell,
  h2fc.Value    AS home_2_father_cell
  FROM Students st
  LEFT OUTER JOIN CustomText h1id ON (h1id.FieldNo={{Home_ID}}       AND h1id.KeyNo=st.DCID)
  LEFT OUTER JOIN CustomText h1mf ON (h1mf.FieldNo={{Mother_First}}  AND h1mf.KeyNo=st.DCID)
  LEFT OUTER JOIN CustomText h1ff ON (h1ff.FieldNo={{Father_First}}  AND h1ff.KeyNo=st.DCID)
  LEFT OUTER JOIN CustomText h1me ON (h1me.FieldNo={{Mother_Email}}  AND h1me.KeyNo=st.DCID)
  LEFT OUTER JOIN CustomText h1fe ON (h1fe.FieldNo={{Father_Email}}  AND h1fe.KeyNo=st.DCID)
  LEFT OUTER JOIN CustomText h1mw ON (h1mw.FieldNo={{Mother_Work_Phone}}  AND h1mw.KeyNo=st.DCID)
  LEFT OUTER JOIN CustomText h1fw ON (h1fw.FieldNo={{Father_Work_Phone}}  AND h1fw.KeyNo=st.DCID)
  LEFT OUTER JOIN CustomText h1mc ON (h1mc.FieldNo={{Mother_Cell}}   AND h1mc.KeyNo=st.DCID)
  LEFT OUTER JOIN CustomText h1fc ON (h1fc.FieldNo={{Father_Cell}}   AND h1fc.KeyNo=st.DCID)
  LEFT OUTER JOIN CustomText h2mf ON (h2mf.FieldNo={{Mother2_First}} AND h2mf.KeyNo=st.DCID)
  LEFT OUTER JOIN CustomText h2ml ON (h2ml.FieldNo={{Mother2_Last}}  AND h2ml.KeyNo=st.DCID)
  LEFT OUTER JOIN CustomText h2ff ON (h2ff.FieldNo={{Father2_First}} AND h2ff.KeyNo=st.DCID)
  LEFT OUTER JOIN CustomText h2fl ON (h2fl.FieldNo={{Father2_Last}}  AND h2fl.KeyNo=st.DCID)
  LEFT OUTER JOIN CustomText h2s  ON (h2s.FieldNo={{Home2_Street}}   AND h2s.KeyNo=st.DCID)
  LEFT OUTER JOIN CustomText h2c  ON (h2c.FieldNo={{Home2_City}}     AND h2c.KeyNo=st.DCID)
  LEFT OUTER JOIN CustomText h2z  ON (h2z.FieldNo={{Home2_Zip}}      AND h2z.KeyNo=st.DCID)
  LEFT OUTER JOIN CustomText h2me ON (h2me.FieldNo={{Mother2_Email}} AND h2me.KeyNo=st.DCID)
  LEFT OUTER JOIN CustomText h2fe ON (h2fe.FieldNo={{Father2_Email}} AND h2fe.KeyNo=st.DCID)
  LEFT OUTER JOIN CustomText h2p  ON (h2p.FieldNo={{Home2_Phone}}    AND h2p.KeyNo=st.DCID) 
  LEFT OUTER JOIN CustomText h2mw ON (h2mw.FieldNo={{Mother2_Work_Phone}}  AND h2mw.KeyNo=st.DCID)
  LEFT OUTER JOIN CustomText h2fw ON (h2fw.FieldNo={{Father2_Work_Phone}}  AND h2fw.KeyNo=st.DCID)
  LEFT OUTER JOIN CustomText h2mc ON (h2mc.FieldNo={{Mother2_Cell}}  AND h2mc.KeyNo=st.DCID)
  LEFT OUTER JOIN CustomText h2fc ON (h2fc.FieldNo={{Father2_Cell}}  AND h2fc.KeyNo=st.DCID)
  WHERE (st.Enroll_Status<=0) }
  
  # property <name>, <type>
  property :id, Integer, :key => true
  property :do_not_list, Boolean
  property :customized, Boolean
  property :last_name, String
  property :see_also_last_name_1, String
  property :see_also_last_name_2, String
  property :see_also_last_name_3, String
  property :see_also_last_name_4, String
  property :see_also_last_name_5, String
  property :see_also_last_name_6, String
  property :child_1_first_name, String, :length => 60
  property :child_1_grade, String
  property :child_2_first_name, String, :length => 60
  property :child_2_grade, String
  property :child_3_first_name, String, :length => 60
  property :child_3_grade, String
  property :child_4_first_name, String, :length => 60
  property :child_4_grade, String
  property :child_5_first_name, String, :length => 60
  property :child_5_grade, String
  property :home_1_mother_first, String
  property :home_1_mother_last, String
  property :home_1_father_first, String
  property :home_1_father_last, String
  property :home_1_street, String, :length => 60
  property :home_1_city, String
  property :home_1_zip, String
  property :home_1_mother_email, String, :length => 60
  property :home_1_father_email, String, :length => 60
  property :home_1_phone, String
  property :home_1_mother_work_phone, String
  property :home_1_father_work_phone, String
  property :home_1_mother_cell, String
  property :home_1_father_cell, String
  property :home_2_mother_first, String
  property :home_2_mother_last, String
  property :home_2_father_first, String
  property :home_2_father_last, String
  property :home_2_street, String, :length => 60
  property :home_2_city, String
  property :home_2_zip, String
  property :home_2_mother_email, String, :length => 60
  property :home_2_father_email, String, :length => 60
  property :home_2_phone, String
  property :home_2_mother_work_phone, String
  property :home_2_father_work_phone, String
  property :home_2_mother_cell, String
  property :home_2_father_cell, String
  property :created_at, DateTime
  property :updated_at, DateTime
  
  def child_1_info
    return nil if child_1_first_name.nil?
    "#{child_1_first_name} (#{Family.nice_grade(child_1_grade)})"
  end
  
  def child_2_info
    return nil if child_2_first_name.nil?
    "#{child_2_first_name} (#{Family.nice_grade(child_2_grade)})"
  end

  def child_3_info
    return nil if child_3_first_name.nil?
    "#{child_3_first_name} (#{Family.nice_grade(child_3_grade)})"
  end

  def child_4_info
    return nil if child_4_first_name.nil?
    "#{child_4_first_name} (#{Family.nice_grade(child_4_grade)})"
  end

  def child_5_info
    return nil if child_5_first_name.nil?
    "#{child_5_first_name} (#{Family.nice_grade(child_5_grade)})"
  end
  
  def home_1_parent_names
    return nil if (home_1_father_first.nil? || home_1_father_last.nil?) && (home_1_mother_first.nil? || home_1_mother_last.nil?)   
    return "#{home_1_mother_first} #{home_1_mother_last}" if home_1_father_first.nil? || home_1_father_last.nil?
    return "#{home_1_father_first} #{home_1_father_last}" if home_1_mother_first.nil? || home_1_mother_last.nil?
    return home_1_mother_last == home_1_father_last ?
      "#{home_1_father_first} & #{home_1_mother_first} #{home_1_mother_last}" :
      "#{home_1_father_first} #{home_1_father_last} & #{home_1_mother_first} #{home_1_mother_last}"
  end
  
  def home_2_parent_names
    return nil if (home_2_father_first.nil? || home_2_father_last.nil?) && (home_2_mother_first.nil? || home_2_mother_last.nil?)   
    return "#{home_2_mother_first} #{home_2_mother_last}" if home_2_father_first.nil? || home_2_father_last.nil?
    return "#{home_2_father_first} #{home_2_father_last}" if home_2_mother_first.nil? || home_2_mother_last.nil?
    return home_2_mother_last == home_2_father_last ?
      "#{home_2_father_first} & #{home_2_mother_first} #{home_2_mother_last}" :
      "#{home_2_father_first} #{home_2_father_last} & #{home_2_mother_first} #{home_2_mother_last}"
  end
  
  def home_1_work_phones
    return nil if home_1_father_work_phone.nil? && home_1_mother_work_phone.nil?
    return "(W) #{home_1_mother_work_phone}" if home_1_father_work_phone.nil?
    return "(W) #{home_1_father_work_phone}" if home_1_mother_work_phone.nil?
    return "(W) #{home_1_father_work_phone} / #{home_1_mother_work_phone}"
  end

  def home_2_work_phones
    return nil if home_2_father_work_phone.nil? && home_2_mother_work_phone.nil?
    return "(W) #{home_2_mother_work_phone}" if home_2_father_work_phone.nil?
    return "(W) #{home_2_father_work_phone}" if home_2_mother_work_phone.nil?
    return "(W) #{home_2_father_work_phone} / #{home_2_mother_work_phone}"
  end
  
  def home_1_cell_phones
    return nil if home_1_father_cell.nil? && home_1_mother_cell.nil?
    return "(C) #{home_1_mother_cell}" if home_1_father_cell.nil?
    return "(C) #{home_1_father_cell}" if home_1_mother_cell.nil?
    return "(C) #{home_1_father_cell} / #{home_1_mother_cell}"
  end

  def home_2_cell_phones
    return nil if home_2_father_cell.nil? && home_2_mother_cell.nil?
    return "(C) #{home_2_mother_cell}" if home_2_father_cell.nil?
    return "(C) #{home_2_father_cell}" if home_2_mother_cell.nil?
    return "(C) #{home_2_father_cell} / #{home_2_mother_cell}"
  end
  
  def home_1_emails
    [ home_1_father_email, home_1_mother_email ].compact.uniq
  end
  
  def home_2_emails
    [ home_2_father_email, home_2_mother_email ].compact.uniq
  end
  
  def has_see_also_names?
    !see_also_last_name_1.nil?
  end
  
  def see_also_names
    SEE_ALSO_NAMES.map { |key| self[key] }.compact
  end
  
  def update_from_powerschool!
    attrs = Family.family_query(POWERSCHOOL_DB_CONFIG, self.id)
    if !attrs.empty?
      attrs = Family.fix_last_names(attrs)
    end
    raise "unable to parse family #{self.id}" if attrs[:last_name].nil?
    self.update(attrs)
  end
  
  class << self
    def nice_grade(grade_level)
      grade_level.to_i == 0 ? 'K' : grade_level.to_s
    end
    
    def reload_all
      family_ids = Family.all_families_query(POWERSCHOOL_DB_CONFIG)
      puts "family_ids"
      puts family_ids.join("\n")
      family_ids.each do |family_id|
        Family.reload(family_id.to_i)
      end
    end
    
    def reload(family_id)
      f = Family.get(family_id) rescue nil
      f.destroy if f
      f = Family.load_from_ps(family_id)
      f
    end
    
    def get_or_load(family_id)
      f = Family.get(family_id) rescue nil
      f = Family.load_from_ps(family_id) unless f
      f
    end
    
    def family_query(db_config, family_id)
      attrs = { }
      dsn = "dbi:#{db_config['adapter']}:#{db_config['database']}"
      dbh = DBI.connect(dsn, db_config['user'], db_config['password'])
      begin
        sql = FAMILY_QUERY.gsub(/\{\{([^}]+)\}\}/) do |field|
          Family.custom_field_number(dbh, $1)
        end
        sql << " AND TO_CHAR(h1id.Value)='#{family_id}' ORDER BY st.Grade_Level DESC, st.First_Name"
        child_i = 0
        sth = dbh.execute(sql)
        while row = sth.fetch do
          vals = Family.process_row(row)
          pre_reg_for_next_year = (vals['ENTRYDATE'].to_s <=> NEXT_YEAR_DATE) > 0
          grade = vals["GRADE_LEVEL"].to_i
          grade += 1 unless pre_reg_for_next_year
          next if grade > 8
          child_i += 1
          attrs["child_#{child_i}_first_name".to_sym] = vals["FIRST_NAME"]
          attrs["child_#{child_i}_last_name".to_sym] = vals["LAST_NAME"]
          attrs["child_#{child_i}_grade".to_sym] = grade
          PARENT_ATTRS.each do |sym|
            next if attrs.key?(sym)
            val = vals[sym.to_s.upcase]
            attrs[sym] = val if val && !val.empty?
          end
          break if child_i == 5
        end
        sth.finish
      rescue
        raise
      end
      dbh.disconnect rescue nil
      attrs
    end
    
    def fix_last_names(attrs)
      last_names = { }
      1.upto(5) do |child_i|
        name = attrs["child_#{child_i}_last_name".to_sym]
        break if name.nil?
        name.upcase!
        last_names[name] = 0 unless last_names.key?(name)
        last_names[name] += 1
      end
      last_names = last_names.to_a.sort { |a, b| a[1] <=> b[1] }
      last_name = last_names[0][0]
      see_also_names = { }
      1.upto(5) do |child_i|
        name = attrs.delete("child_#{child_i}_last_name".to_sym)
        break if name.nil?
        up_name = name.upcase
        if up_name == last_name
          attrs[:last_name] = name if attrs[:last_name].nil?
        else
          see_also_names[up_name] = 1
          attrs["child_#{child_i}_first_name".to_sym] << " #{name}"
        end
      end
      PARENT_LAST_NAMES.each do |key|
        name = attrs[key]
        next if name.nil?
        up_name = name.upcase
        see_also_names[up_name] = 1 if up_name != last_name
      end
      see_also_names.keys.sort.each_with_index do |name, i|
        attrs["see_also_last_name_#{i+1}"] = name
      end
      attrs
    end
    
    protected
    
    def load_from_ps(family_id)
      f = Family.new
      f.id = family_id
      f.save!
      begin
        f.update_from_powerschool!
      rescue
        puts "Error: #{$!}: destroying record"
        f.destroy
        f = nil
      end
      f
    end
    
    # can raise exception
    def custom_field_number(dbh, field)
      field, fileno = field.split(/:/)
      fileno = 100 unless fileno
      key = "#{field.downcase}:#{fileno}"
      if !@@custom_fields.key?(field)
        field_id = 0
        sql = "SELECT ID FROM FieldsTable WHERE FileNo=#{fileno} AND REGEXP_LIKE(Name,'^#{field}$','i')"
        row = dbh.select_one(sql)
        field_id = row[0].to_i if row
        @@custom_fields[key] = field_id
      end
      @@custom_fields[key]
    end
    
    def process_row(row)
      vals = { }
      row.each_with_name do |val, name|
        if val.is_a?(Float) || val.is_a?(BigDecimal)
          val = val.to_i 
        else
          if val.is_a?(OCI8::BFILE) || val.is_a?(OCI8::BLOB) || val.is_a?(OCI8::CLOB)
            val = val.read
          end
          val = val.to_s.gsub(/"/, "'")
        end
        vals[name] = val
      end
      vals
    end
    
    def all_families_query(db_config)
      family_ids = { }
      dsn = "dbi:#{db_config['adapter']}:#{db_config['database']}"
      dbh = DBI.connect(dsn, db_config['user'], db_config['password'])
      begin
        sql = ALL_FAMILIES_QUERY.gsub(/\{\{([^}]+)\}\}/) do |field|
          Family.custom_field_number(dbh, $1)
        end
        sth = dbh.execute(sql)
        while row = sth.fetch do
          vals = Family.process_row(row)
          family_ids[vals["FAMILY_ID"]] = 1
        end
        sth.finish
      rescue
      end
      dbh.disconnect rescue nil
      family_ids.keys.sort
    end
  end
end
