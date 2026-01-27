theory imp_SymbolicInterpreter_rho_set_twoqtvc
  imports "NTP4Verif.NTP4Verif" "../../lib/isabelle/imp_Syntax" "../../lib/isabelle/imp_ConcreteSemantics" "../../lib/isabelle/imp_Svar" "../../lib/isabelle/imp_Constraint" "../../lib/isabelle/imp_SymState" "../../lib/isabelle/imp_FreshSvar" "../../lib/isabelle/imp_SymStateSet"
begin
consts compose :: "(svar \<Rightarrow> int) \<Rightarrow> t \<Rightarrow> program_var \<Rightarrow> int option"
axiomatization where compose'def:   "compose rho sigma x = (case get sigma x of Some v \<Rightarrow> Some (rho v) | None \<Rightarrow> None)"
  for rho :: "svar \<Rightarrow> int"
  and sigma :: "t"
  and x :: "program_var"
definition state_extends :: "sym_state \<Rightarrow> sym_state \<Rightarrow> _"
  where "state_extends s s' \<longleftrightarrow> imp_Svar.to_fset (vars s) |\<subseteq>| imp_Svar.to_fset (vars s') \<and> (\<forall>(v :: svar). v |\<in>| imp_Svar.to_fset (vars s) \<longrightarrow> rho s v = rho s' v)" for s s'
theorem rho_set_two'vc:
  fixes v1 :: "svar"
  fixes v2 :: "svar"
  fixes rho :: "svar \<Rightarrow> int"
  fixes n1 :: "int"
  fixes n2 :: "int"
  assumes fact0: "\<not>v1 = v2"
  shows "rho(v2 := n2, v1 := n1) = rho(v1 := n1, v2 := n2)"
  sorry
end
