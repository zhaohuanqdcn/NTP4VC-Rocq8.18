theory c_UChar
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref" c_C int_Unsigned
begin
typedecl  cast_mem
consts mi :: "cast_mem \<Rightarrow> int"
consts ma :: "cast_mem \<Rightarrow> int"
consts z :: "cast_mem \<Rightarrow> zone"
consts l :: "cast_mem \<Rightarrow> int"
consts ok :: "cast_mem \<Rightarrow> bool"
end
