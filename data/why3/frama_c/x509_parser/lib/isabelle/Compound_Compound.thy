theory Compound_Compound
  imports "NTP4Verif.NTP4Verif" "Why3STD.Qed_Qed" "Why3STD.Memory_Memory"
begin
definition shift___anonstruct__name_oid_11 :: "addr \<Rightarrow> int \<Rightarrow> addr"
  where "shift___anonstruct__name_oid_11 p k = shift p ((3 :: int) * k)" for p k
definition shift___anonstruct__ext_oid_14 :: "addr \<Rightarrow> int \<Rightarrow> addr"
  where "shift___anonstruct__ext_oid_14 p k = shift p ((3 :: int) * k)" for p k
definition shift___anonstruct__kp_oid_13 :: "addr \<Rightarrow> int \<Rightarrow> addr"
  where "shift___anonstruct__kp_oid_13 p k = shift p ((2 :: int) * k)" for p k
end
