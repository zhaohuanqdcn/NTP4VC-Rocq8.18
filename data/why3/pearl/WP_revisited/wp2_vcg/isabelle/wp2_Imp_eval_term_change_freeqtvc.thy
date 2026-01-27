theory wp2_Imp_eval_term_change_freeqtvc
  imports "NTP4Verif.NTP4Verif"
begin
datatype  "datatype" = Tint | Tbool
datatype  operator = Oplus | Ominus | Omult | Ole
typedecl  ident
datatype  "term" = Tconst "int" | Tvar "int" | Tderef "int" | Tbin "term" "operator" "term"
datatype  fmla = Fterm "term" | Fand "fmla" "fmla" | Fnot "fmla" | Fimplies "fmla" "fmla" | Flet "int" "term" "fmla" | Fforall "int" "datatype" "fmla"
datatype  "value" = Vint "int" | Vbool "bool"
typedecl  env
definition eval_bin :: "value \<Rightarrow> operator \<Rightarrow> value \<Rightarrow> value"
  where "eval_bin x op y = (case (x, y) of (Vint x1, Vint y1) \<Rightarrow> (case op of Oplus \<Rightarrow> Vint (x1 + y1) | Ominus \<Rightarrow> Vint (x1 - y1) | Omult \<Rightarrow> Vint (x1 * y1) | Ole \<Rightarrow> Vbool (if x1 \<le> y1 then True else False)) | (_, _) \<Rightarrow> Vbool False)" for x op y
fun eval_term :: "(int \<Rightarrow> value) \<Rightarrow> (int \<Rightarrow> value) \<Rightarrow> term \<Rightarrow> value"
  where "eval_term sigma pi (Tconst n) = Vint n" for sigma pi n
      | "eval_term sigma pi (Tvar id1) = pi id1" for sigma pi id1
      | "eval_term sigma pi (Tderef id1) = sigma id1" for sigma pi id1
      | "eval_term sigma pi (Tbin t1 op t2) = eval_bin (eval_term sigma pi t1) op (eval_term sigma pi t2)" for sigma pi t1 op t2
fun eval_fmla :: "(int \<Rightarrow> value) \<Rightarrow> (int \<Rightarrow> value) \<Rightarrow> fmla \<Rightarrow> _"
  where "eval_fmla sigma pi (Fterm t) = (eval_term sigma pi t = Vbool True)" for sigma pi t
      | "eval_fmla sigma pi (Fand f1 f2) = (eval_fmla sigma pi f1 \<and> eval_fmla sigma pi f2)" for sigma pi f1 f2
      | "eval_fmla sigma pi (Fnot f1) = (\<not>eval_fmla sigma pi f1)" for sigma pi f1
      | "eval_fmla sigma pi (Fimplies f1 f2) = (eval_fmla sigma pi f1 \<longrightarrow> eval_fmla sigma pi f2)" for sigma pi f1 f2
      | "eval_fmla sigma pi (Flet x t f1) = eval_fmla sigma (pi(x := eval_term sigma pi t)) f1" for sigma pi x t f1
      | "eval_fmla sigma pi (Fforall x Tint f1) = (\<forall>(n :: int). eval_fmla sigma (pi(x := Vint n)) f1)" for sigma pi x f1
      | "eval_fmla sigma pi (Fforall x Tbool f1) = (\<forall>(b :: bool). eval_fmla sigma (pi(x := Vbool b)) f1)" for sigma pi x f1
fun subst_term :: "term \<Rightarrow> int \<Rightarrow> int \<Rightarrow> term"
  where "subst_term (Tconst x) r v = Tconst x" for x r v
      | "subst_term (Tvar x) r v = Tvar x" for x r v
      | "subst_term (Tderef x) r v = (if r = x then Tvar v else Tderef x)" for x r v
      | "subst_term (Tbin e1 op e2) r v = Tbin (subst_term e1 r v) op (subst_term e2 r v)" for e1 op e2 r v
fun fresh_in_term :: "int \<Rightarrow> term \<Rightarrow> _"
  where "fresh_in_term id1 (Tconst x) = True" for id1 x
      | "fresh_in_term id1 (Tvar v) = (\<not>id1 = v)" for id1 v
      | "fresh_in_term id1 (Tderef x) = True" for id1 x
      | "fresh_in_term id1 (Tbin t1 x t2) = (fresh_in_term id1 t1 \<and> fresh_in_term id1 t2)" for id1 t1 x t2
theorem eval_term_change_free'vc:
  fixes id1 :: "int"
  fixes t :: "term"
  fixes sigma :: "int \<Rightarrow> value"
  fixes pi :: "int \<Rightarrow> value"
  fixes v :: "value"
  assumes fact0: "fresh_in_term id1 t"
  shows "eval_term sigma (pi(id1 := v)) t = eval_term sigma pi t"
  sorry
end
