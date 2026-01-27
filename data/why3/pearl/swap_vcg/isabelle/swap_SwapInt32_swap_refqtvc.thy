theory swap_SwapInt32_swap_refqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref"
begin
typedecl  int32
consts int32'int :: "int32 \<Rightarrow> int"
definition int32'eq :: "int32 \<Rightarrow> int32 \<Rightarrow> _"
  where "int32'eq a b \<longleftrightarrow> int32'int a = int32'int b" for a b
axiomatization where int32'inj:   "a = b"
 if "int32'eq a b"
  for a :: "int32"
  and b :: "int32"
definition in_bounds :: "int32 \<Rightarrow> _"
  where "in_bounds n \<longleftrightarrow> -(2147483648 :: int) \<le> int32'int n \<and> int32'int n \<le> (2147483647 :: int)" for n
theorem swap_ref'vc:
  fixes a :: "int32"
  fixes b :: "int32"
  fixes o1 :: "int32"
  fixes o2 :: "int32"
  fixes o3 :: "int32"
  assumes fact0: "in_bounds a"
  assumes fact1: "in_bounds b"
  assumes fact2: "int32'int o1 = (if int32'int a + int32'int b < -(2147483648 :: int) then int32'int a + int32'int b + ((2147483647 :: int) - -(2147483648 :: int) + (1 :: int)) else if (2147483647 :: int) < int32'int a + int32'int b then int32'int a + int32'int b - ((2147483647 :: int) - -(2147483648 :: int) + (1 :: int)) else int32'int a + int32'int b)"
  assumes fact3: "int32'int o2 = (if int32'int o1 - int32'int b < -(2147483648 :: int) then int32'int o1 - int32'int b + ((2147483647 :: int) - -(2147483648 :: int) + (1 :: int)) else if (2147483647 :: int) < int32'int o1 - int32'int b then int32'int o1 - int32'int b - ((2147483647 :: int) - -(2147483648 :: int) + (1 :: int)) else int32'int o1 - int32'int b)"
  assumes fact4: "int32'int o3 = (if int32'int o1 - int32'int o2 < -(2147483648 :: int) then int32'int o1 - int32'int o2 + ((2147483647 :: int) - -(2147483648 :: int) + (1 :: int)) else if (2147483647 :: int) < int32'int o1 - int32'int o2 then int32'int o1 - int32'int o2 - ((2147483647 :: int) - -(2147483648 :: int) + (1 :: int)) else int32'int o1 - int32'int o2)"
  shows "int32'int o3 = int32'int b"
  and "int32'int o2 = int32'int a"
  sorry
end
