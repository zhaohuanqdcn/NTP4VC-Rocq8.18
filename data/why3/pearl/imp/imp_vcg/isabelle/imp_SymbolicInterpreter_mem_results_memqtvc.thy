theory imp_SymbolicInterpreter_mem_results_memqtvc
  imports "NTP4Verif.NTP4Verif" "../../lib/isabelle/imp_Syntax" "../../lib/isabelle/imp_ConcreteSemantics" "../../lib/isabelle/imp_Svar" "../../lib/isabelle/imp_Constraint" "../../lib/isabelle/imp_SymState" "../../lib/isabelle/imp_FreshSvar" "../../lib/isabelle/imp_SymStateSet"
begin
consts compose :: "(svar \<Rightarrow> int) \<Rightarrow> t \<Rightarrow> program_var \<Rightarrow> int option"
axiomatization where compose'def:   "compose rho sigma x = (case get sigma x of Some v \<Rightarrow> Some (rho v) | None \<Rightarrow> None)"
  for rho :: "svar \<Rightarrow> int"
  and sigma :: "t"
  and x :: "program_var"
definition state_extends :: "sym_state \<Rightarrow> sym_state \<Rightarrow> _"
  where "state_extends s s' \<longleftrightarrow> imp_Svar.to_fset (vars s) |\<subseteq>| imp_Svar.to_fset (vars s') \<and> (\<forall>(v :: svar). v |\<in>| imp_Svar.to_fset (vars s) \<longrightarrow> rho s v = rho s' v)" for s s'
consts svar_set_add :: "svar \<Rightarrow> imp_Svar.set \<Rightarrow> imp_Svar.set"
axiomatization where svar_set_add'def'0:   "imp_Svar.to_fset (svar_set_add v vs) = finsert v (imp_Svar.to_fset vs)"
  for v :: "svar"
  and vs :: "imp_Svar.set"
axiomatization where svar_set_add'def'1:   "if v |\<in>| imp_Svar.to_fset vs then fcard (imp_Svar.to_fset (svar_set_add v vs)) = fcard (imp_Svar.to_fset vs) else int (fcard (imp_Svar.to_fset (svar_set_add v vs))) = int (fcard (imp_Svar.to_fset vs)) + (1 :: int)"
  for v :: "svar"
  and vs :: "imp_Svar.set"
theorem mem_results_mem'vc:
  fixes s :: "sym_state"
  fixes normals :: "sym_state fset"
  fixes unbounds :: "sym_state fset"
  fixes limits :: "sym_state fset"
  shows "s |\<in>| normals \<or> s |\<in>| unbounds \<or> s |\<in>| limits \<longleftrightarrow> (\<exists>(bhv :: behavior). (case bhv of Cnormal \<Rightarrow> s |\<in>| normals | Cunbound_var \<Rightarrow> s |\<in>| unbounds | Cloop_limit \<Rightarrow> s |\<in>| limits))"
  sorry
end
