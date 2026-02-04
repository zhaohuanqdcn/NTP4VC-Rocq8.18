theory S1_size_type_pair_S1_size_type_pair
  imports "NTP4Verif.NTP4Verif" "Why3STD.Qed_Qed" "Why3STD.Cint_Cint"
begin
datatype  s1_size_type_pair = s1_size_type_pair'mk (f1_size_type_pair_first: "int") (f1_size_type_pair_second: "int")
definition iss1_size_type_pair :: "s1_size_type_pair \<Rightarrow> _"
  where "iss1_size_type_pair s \<longleftrightarrow> is_uint32 (f1_size_type_pair_first s) \<and> is_uint32 (f1_size_type_pair_second s)" for s
end
