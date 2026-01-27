theory coincidence_count_CoincidenceCount_drop_leftqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref"
begin
consts mixfix_lbrb_closure :: "'a list \<Rightarrow> int \<Rightarrow> 'a"
axiomatization where mixfix_lbrb_closure_def:   "mixfix_lbrb_closure y y1 = y ! nat y1"
  for y :: "'a list"
  and y1 :: "int"
definition setof :: "'a list \<Rightarrow> 'a fset"
  where "setof a = mixfix_lbrb_closure a |`| Ico_fset_int (0 :: int) (int (length a))" for a
definition drop :: "'a list \<Rightarrow> int \<Rightarrow> 'a fset"
  where "drop a n = mixfix_lbrb_closure a |`| Ico_fset_int n (int (length a))" for a n
theorem drop_left'vc:
  fixes n :: "int"
  fixes a :: "'a list"
  assumes fact0: "(0 :: int) \<le> n"
  assumes fact1: "n < int (length a)"
  shows "drop a n = finsert (a ! nat n) (drop a (n + (1 :: int)))"
  sorry
end
