theory string_StringRealization
  imports "NTP4Verif.NTP4Verif"
begin
consts concat :: "string \<Rightarrow> string \<Rightarrow> string"
consts length :: "string \<Rightarrow> int"
consts lt :: "string \<Rightarrow> string \<Rightarrow> bool"
consts le :: "string \<Rightarrow> string \<Rightarrow> bool"
consts s_at :: "string \<Rightarrow> int \<Rightarrow> string"
consts substring :: "string \<Rightarrow> int \<Rightarrow> int \<Rightarrow> string"
consts prefixof :: "string \<Rightarrow> string \<Rightarrow> bool"
consts suffixof :: "string \<Rightarrow> string \<Rightarrow> bool"
consts contains :: "string \<Rightarrow> string \<Rightarrow> bool"
consts indexof :: "string \<Rightarrow> string \<Rightarrow> int \<Rightarrow> int"
consts replace :: "string \<Rightarrow> string \<Rightarrow> string \<Rightarrow> string"
consts replaceall :: "string \<Rightarrow> string \<Rightarrow> string \<Rightarrow> string"
consts to_int :: "string \<Rightarrow> int"
definition is_digit :: "string \<Rightarrow> _"
  where "is_digit s \<longleftrightarrow> ((0 :: int) \<le> to_int s \<and> to_int s \<le> (9 :: int)) \<and> length s = (1 :: int)" for s
consts from_int :: "int \<Rightarrow> string"
end
