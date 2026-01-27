theory euler_sieve_EulerSieveImpl_conservation_inv_arr_on_markqtvc
  imports "NTP4Verif.NTP4Verif" "./euler_sieve_ArithmeticResults" "./euler_sieve_DivisibilityResults" "./euler_sieve_EulerSieveSpec" "mach.array_ArrayInt63"
begin
theorem conservation_inv_arr_on_mark'vc:
  fixes arr :: "int list"
  fixes i :: "int"
  fixes j :: "int"
  fixes k :: "int"
  assumes fact0: "\<forall>(j :: int) (k :: int). (0 :: int) \<le> j \<and> j < int (length arr) \<longrightarrow> j < k \<and> k < abs (arr ! nat j) ediv (2 :: int) \<longrightarrow> arr ! nat k < (0 :: int)"
  assumes fact1: "\<forall>(i :: int). (0 :: int) \<le> i \<and> i < int (length arr) \<longrightarrow> i < abs (arr ! nat i) ediv (2 :: int) \<and> abs (arr ! nat i) ediv (2 :: int) \<le> int (length arr)"
  assumes fact2: "(0 :: int) \<le> i"
  assumes fact3: "i < int (length arr)"
  assumes fact4: "(0 :: int) \<le> arr ! nat i"
  assumes fact5: "(0 :: int) \<le> j"
  assumes fact6: "j < int (length arr)"
  assumes fact7: "j < k"
  assumes fact8: "k < abs (arr[nat i := -arr ! nat i] ! nat j) ediv (2 :: int)"
  shows "arr[nat i := -arr ! nat i] ! nat k < (0 :: int)"
  sorry
end
