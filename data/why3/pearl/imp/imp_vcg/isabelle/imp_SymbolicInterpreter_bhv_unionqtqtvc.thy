theory imp_SymbolicInterpreter_bhv_unionqtqtvc
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
theorem bhv_union''vc:
  fixes bhv :: "behavior"
  fixes s :: "sym_state"
  fixes normals2 :: "sym_state fset"
  fixes unbounds1 :: "sym_state fset"
  fixes unbounds2 :: "sym_state fset"
  fixes limits1 :: "sym_state fset"
  fixes limits2 :: "sym_state fset"
  assumes fact0: "case bhv of Cnormal \<Rightarrow> s |\<in>| normals2 | Cunbound_var \<Rightarrow> s |\<in>| unbounds1 |\<union>| unbounds2 | Cloop_limit \<Rightarrow> s |\<in>| limits1 |\<union>| limits2"
  shows "(case bhv of Cnormal \<Rightarrow> s |\<in>| normals2 | Cunbound_var \<Rightarrow> s |\<in>| unbounds2 | Cloop_limit \<Rightarrow> s |\<in>| limits2) \<or> bhv = Cunbound_var \<and> s |\<in>| unbounds1 \<or> bhv = Cloop_limit \<and> s |\<in>| limits1"
  sorry
end
