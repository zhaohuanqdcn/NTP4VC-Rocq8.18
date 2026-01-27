theory register_allocation_InfinityOfRegisters_recoverqtvc
  imports "NTP4Verif.NTP4Verif" "./register_allocation_Spec" "./register_allocation_DWP"
begin
theorem recover'vc:
  fixes h :: "hcode"
  fixes e :: "expr"
  fixes r :: "int"
  fixes s :: "state"
  assumes fact0: "hcode_ok h"
  assumes fact1: "post1 h = expr_post e r"
  shows "let s' :: state = exec_list (hcode1 h) s in mem s' = mem s \<and> reg s' r = eval (mem s) e \<and> st s' = st s \<and> (\<forall>(r' :: int). r' < r \<longrightarrow> reg s' r' = reg s r')"
  sorry
end
