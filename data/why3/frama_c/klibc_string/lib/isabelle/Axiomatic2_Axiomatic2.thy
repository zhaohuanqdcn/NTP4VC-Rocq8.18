theory Axiomatic2_Axiomatic2
  imports "NTP4Verif.NTP4Verif" "Why3STD.Qed_Qed"
begin
definition p_is_lower :: "int \<Rightarrow> _"
  where "p_is_lower c \<longleftrightarrow> (97 :: int) \<le> c \<and> c \<le> (122 :: int)" for c
definition p_is_upper :: "int \<Rightarrow> _"
  where "p_is_upper c \<longleftrightarrow> (65 :: int) \<le> c \<and> c \<le> (90 :: int)" for c
end
