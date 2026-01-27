theory fib_memo_FibMemo_fiboqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref" "Why3STD.int_Fibonacci"
begin
typedecl  table
definition inv :: "(int \<Rightarrow> int option) \<Rightarrow> _"
  where "inv t \<longleftrightarrow> (\<forall>(x :: int) (y :: int). t x = Some y \<longrightarrow> y = fib x)" for t
theorem fibo'vc:
  fixes n :: "int"
  fixes table1 :: "int \<Rightarrow> int option"
  assumes fact0: "(0 :: int) \<le> n"
  assumes fact1: "inv table1"
  shows "if n \<le> (1 :: int) then n = fib n \<and> inv table1 else let o1 :: int = n - (2 :: int) in (((0 :: int) \<le> (2 :: int) * n \<and> (2 :: int) * o1 + (1 :: int) < (2 :: int) * n) \<and> (0 :: int) \<le> o1 \<and> inv table1) \<and> (\<forall>(table2 :: int \<Rightarrow> int option). inv table2 \<longrightarrow> (let o2 :: int = n - (1 :: int) in (((0 :: int) \<le> (2 :: int) * n \<and> (2 :: int) * o2 + (1 :: int) < (2 :: int) * n) \<and> (0 :: int) \<le> o2 \<and> inv table2) \<and> (\<forall>(table3 :: int \<Rightarrow> int option). inv table3 \<longrightarrow> fib o2 + fib o1 = fib n \<and> inv table3)))"
  sorry
end
