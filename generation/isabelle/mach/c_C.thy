theory c_C
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref" int_Unsigned
begin
definition in_us_bounds :: "int \<Rightarrow> _"
  where "in_us_bounds n \<longleftrightarrow> (0 :: int) \<le> n \<and> n \<le> (4294967295 :: int)" for n
definition in_bounds :: "int \<Rightarrow> _"
  where "in_bounds n \<longleftrightarrow> -(2147483648 :: int) \<le> n \<and> n \<le> (2147483647 :: int)" for n
typedecl  zone
consts null_zone :: "zone"
typedecl 'a ptr
consts data :: "'a ptr \<Rightarrow> 'a list"
consts offset :: "'a ptr \<Rightarrow> int"
consts min :: "'a ptr \<Rightarrow> int"
consts max :: "'a ptr \<Rightarrow> int"
consts writable :: "'a ptr \<Rightarrow> bool"
consts zone1 :: "'a ptr \<Rightarrow> zone"
definition plength :: "'a ptr \<Rightarrow> int"
  where "plength p = int (length (data p))" for p
definition pelts :: "'a ptr \<Rightarrow> int \<Rightarrow> 'a"
  where "pelts p = nth (data p) o nat" for p
consts is_not_null :: "'a ptr \<Rightarrow> bool"
axiomatization where is_not_null'spec:   "is_not_null p \<longleftrightarrow> \<not>zone1 p = null_zone"
  for p :: "'a ptr"
definition valid_ptr_shift :: "'a ptr \<Rightarrow> int \<Rightarrow> _"
  where "valid_ptr_shift p i \<longleftrightarrow> min p \<le> offset p + i \<and> offset p + i < max p" for p i
definition valid :: "'a ptr \<Rightarrow> int \<Rightarrow> _"
  where "valid p sz \<longleftrightarrow> in_bounds sz \<and> (0 :: int) \<le> sz \<and> ((0 :: int) \<le> min p \<and> min p \<le> offset p) \<and> offset p + sz \<le> max p \<and> max p \<le> plength p" for p sz
axiomatization where valid_itv_to_shift:   "valid_ptr_shift p i"
 if "valid p sz"
 and "(0 :: int) \<le> i"
 and "i < sz"
  for p :: "'a ptr"
  and sz :: "int"
  and i :: "int"
end
