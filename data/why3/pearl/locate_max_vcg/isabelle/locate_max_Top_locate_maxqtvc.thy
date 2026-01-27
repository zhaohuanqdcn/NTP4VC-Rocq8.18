theory locate_max_Top_locate_maxqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref" "mach.c_C" "mach.int_Unsigned"
begin
definition mixfix_lbrb :: "'a ptr \<Rightarrow> int \<Rightarrow> 'a"
  where "mixfix_lbrb a i = (nth (data a) o nat) (offset a + i)" for a i
theorem locate_max'vc:
  fixes n :: "32 word"
  fixes a :: "64 word ptr"
  assumes fact0: "(0 :: int) < sint n"
  assumes fact1: "valid a (sint n)"
  shows "int'32_in_bounds (sint n - (1 :: int))"
  and "\<forall>(o1 :: 32 word). sint o1 = sint n - (1 :: int) \<longrightarrow> ((1 :: int) \<le> sint o1 + (1 :: int) \<longrightarrow> (((0 :: int) \<le> (0 :: int) \<and> (0 :: int) < sint n) \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < (1 :: int) \<longrightarrow> sint (mixfix_lbrb a i) \<le> sint (mixfix_lbrb a (0 :: int)))) \<and> (\<forall>(idx :: 32 word). (\<forall>(j :: 32 word). let j1 :: int = sint j in ((1 :: int) \<le> j1 \<and> j1 \<le> sint o1) \<and> ((0 :: int) \<le> sint idx \<and> sint idx < sint n) \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < j1 \<longrightarrow> sint (mixfix_lbrb a i) \<le> sint (mixfix_lbrb a (sint idx))) \<longrightarrow> (c_C.min a \<le> offset a + sint j \<and> offset a + sint j < c_C.max a) \<and> (c_C.min a \<le> offset a + sint idx \<and> offset a + sint idx < c_C.max a) \<and> (if sint (pelts a (offset a + sint idx)) < sint (pelts a (offset a + sint j)) then ((0 :: int) \<le> sint j \<and> sint j < sint n) \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < j1 + (1 :: int) \<longrightarrow> sint (mixfix_lbrb a i) \<le> sint (mixfix_lbrb a (sint j))) else ((0 :: int) \<le> sint idx \<and> sint idx < sint n) \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < j1 + (1 :: int) \<longrightarrow> sint (mixfix_lbrb a i) \<le> sint (mixfix_lbrb a (sint idx))))) \<and> (((0 :: int) \<le> sint idx \<and> sint idx < sint n) \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < sint o1 + (1 :: int) \<longrightarrow> sint (mixfix_lbrb a i) \<le> sint (mixfix_lbrb a (sint idx))) \<longrightarrow> ((0 :: int) \<le> sint idx \<and> sint idx < sint n) \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < sint n \<longrightarrow> sint (mixfix_lbrb a i) \<le> sint (mixfix_lbrb a (sint idx)))))) \<and> (sint o1 + (1 :: int) < (1 :: int) \<longrightarrow> ((0 :: int) \<le> (0 :: int) \<and> (0 :: int) < sint n) \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < sint n \<longrightarrow> sint (mixfix_lbrb a i) \<le> sint (mixfix_lbrb a (0 :: int))))"
  sorry
end
