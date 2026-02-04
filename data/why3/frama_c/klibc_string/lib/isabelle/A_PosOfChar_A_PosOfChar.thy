theory A_PosOfChar_A_PosOfChar
  imports "NTP4Verif.NTP4Verif" "Why3STD.Qed_Qed" "Why3STD.Memory_Memory" "Why3STD.Cint_Cint" "../../lib/isabelle/Axiomatic1_Axiomatic1" "../../lib/isabelle/Compound_Compound" "../../lib/isabelle/A_Length_A_Length" "../../lib/isabelle/Axiomatic_Axiomatic"
begin
consts l_posofchar :: "(addr \<Rightarrow> int) \<Rightarrow> addr \<Rightarrow> int \<Rightarrow> int"
axiomatization where Q_pos_of_char:   "l_posofchar mchar_0 s c = pos_0"
 if "is_sint32 c"
 and "p_exists_first_occurence_of_char malloc_0 mchar_0 s c pos_0"
  for c :: "int"
  and malloc_0 :: "int \<Rightarrow> int"
  and mchar_0 :: "addr \<Rightarrow> int"
  and s :: "addr"
  and pos_0 :: "int"
end
