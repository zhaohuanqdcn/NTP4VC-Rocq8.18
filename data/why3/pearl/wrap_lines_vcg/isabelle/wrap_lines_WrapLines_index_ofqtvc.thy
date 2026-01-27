theory wrap_lines_WrapLines_index_ofqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref"
begin
typedecl  char
consts space :: "char"
consts newline :: "char"
theorem index_of'vc:
  fixes from1 :: "int"
  fixes s :: "char list"
  fixes c :: "char"
  assumes fact0: "(0 :: int) \<le> from1"
  assumes fact1: "from1 \<le> int (length s)"
  shows "from1 \<le> from1"
  and "from1 \<le> int (length s)"
  and "\<forall>(i :: int). from1 \<le> i \<and> i < from1 \<longrightarrow> \<not>s ! nat i = c"
  and "\<forall>(k :: int). (from1 \<le> k \<and> k \<le> int (length s)) \<and> (\<forall>(i :: int). from1 \<le> i \<and> i < k \<longrightarrow> \<not>s ! nat i = c) \<longrightarrow> (if k < int (length s) then ((0 :: int) \<le> k \<and> k < int (length s)) \<and> (if s ! nat k = c then k = -(1 :: int) \<and> (\<forall>(i :: int). from1 \<le> i \<and> i < int (length s) \<longrightarrow> \<not>s ! nat i = c) \<or> (from1 \<le> k \<and> k < int (length s)) \<and> s ! nat k = c \<and> (\<forall>(i :: int). from1 \<le> i \<and> i < k \<longrightarrow> \<not>s ! nat i = c) else ((0 :: int) \<le> int (length s) - k \<and> int (length s) - (k + (1 :: int)) < int (length s) - k) \<and> (from1 \<le> k + (1 :: int) \<and> k + (1 :: int) \<le> int (length s)) \<and> (\<forall>(i :: int). from1 \<le> i \<and> i < k + (1 :: int) \<longrightarrow> \<not>s ! nat i = c)) else (\<forall>(i :: int). from1 \<le> i \<and> i < int (length s) \<longrightarrow> \<not>s ! nat i = c) \<or> (from1 \<le> -(1 :: int) \<and> -(1 :: int) < int (length s)) \<and> s ! nat (-(1 :: int)) = c \<and> (\<forall>(i :: int). from1 \<le> i \<and> i < -(1 :: int) \<longrightarrow> \<not>s ! nat i = c))"
  sorry
end
