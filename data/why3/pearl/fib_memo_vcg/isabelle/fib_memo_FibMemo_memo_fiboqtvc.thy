theory fib_memo_FibMemo_memo_fiboqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref" "Why3STD.int_Fibonacci"
begin
typedecl  table
definition inv :: "(int \<Rightarrow> int option) \<Rightarrow> _"
  where "inv t \<longleftrightarrow> (\<forall>(x :: int) (y :: int). t x = Some y \<longrightarrow> y = fib x)" for t
theorem memo_fibo'vc:
  fixes n :: "int"
  fixes table1 :: "int \<Rightarrow> int option"
  assumes fact0: "(0 :: int) \<le> n"
  assumes fact1: "inv table1"
  shows "\<forall>(result :: int). table1 n = Some result \<longrightarrow> result = fib n \<and> inv table1"
  and "table1 n = None \<longrightarrow> (((0 :: int) \<le> (2 :: int) * n + (1 :: int) \<and> (2 :: int) * n < (2 :: int) * n + (1 :: int)) \<and> (0 :: int) \<le> n \<and> inv table1) \<and> (\<forall>(table2 :: int \<Rightarrow> int option). let fn :: int = fib n in inv table2 \<longrightarrow> fn = fib n \<and> inv (table2(n := Some fn)))"
  sorry
end
