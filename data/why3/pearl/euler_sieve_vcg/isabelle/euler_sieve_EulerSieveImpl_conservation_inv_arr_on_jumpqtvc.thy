theory euler_sieve_EulerSieveImpl_conservation_inv_arr_on_jumpqtvc
  imports "NTP4Verif.NTP4Verif" "./euler_sieve_ArithmeticResults" "./euler_sieve_DivisibilityResults" "./euler_sieve_EulerSieveSpec" "mach.array_ArrayInt63"
begin
theorem conservation_inv_arr_on_jump'vc:
  fixes min :: "int"
  fixes arr :: "int list"
  fixes i :: "int"
  fixes j :: "int"
  fixes k :: "int"
  assumes fact0: "(0 :: int) \<le> min"
  assumes fact1: "\<forall>(j :: int) (k :: int). min \<le> j \<and> j < int (length arr) \<longrightarrow> j < k \<and> k < abs (arr ! nat j) ediv (2 :: int) \<longrightarrow> arr ! nat k < (0 :: int)"
  assumes fact2: "\<forall>(i :: int). min \<le> i \<and> i < int (length arr) \<longrightarrow> i < abs (arr ! nat i) ediv (2 :: int) \<and> abs (arr ! nat i) ediv (2 :: int) \<le> int (length arr)"
  assumes fact3: "min \<le> i"
  assumes fact4: "i < int (length arr)"
  assumes fact5: "(0 :: int) \<le> arr ! nat i ediv (2 :: int)"
  assumes fact6: "arr ! nat i ediv (2 :: int) < int (length arr)"
  assumes fact7: "arr ! nat (arr ! nat i ediv (2 :: int)) < (0 :: int)"
  assumes fact8: "min \<le> j"
  assumes fact9: "j < int (length arr)"
  assumes fact10: "j < k"
  assumes fact11: "k < abs (arr[nat i := -arr ! nat (arr ! nat i ediv (2 :: int))] ! nat j) ediv (2 :: int)"
  shows "arr[nat i := -arr ! nat (arr ! nat i ediv (2 :: int))] ! nat k < (0 :: int)"
  sorry
end
