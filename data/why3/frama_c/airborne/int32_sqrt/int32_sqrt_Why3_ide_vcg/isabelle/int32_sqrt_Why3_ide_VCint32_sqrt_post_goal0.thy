theory int32_sqrt_Why3_ide_VCint32_sqrt_post_goal0
  imports "NTP4Verif.NTP4Verif" "Why3STD.Qed_Qed" "Why3STD.Cint_Cint"
begin
theorem goal0:
  fixes i :: "int"
  fixes i_2 :: "int"
  fixes i_1 :: "int"
  shows "let x :: int = to_uint32 (to_uint32 (i + to_uint32 (i_2 cdiv i)) cdiv (2 :: int)) in \<not>i_2 = (0 :: int) \<longrightarrow> (0 :: int) < i \<longrightarrow> (0 :: int) \<le> i \<longrightarrow> (0 :: int) \<le> i_2 \<longrightarrow> i \<le> i_2 \<longrightarrow> i_1 \<le> (40 :: int) \<longrightarrow> i \<le> (2147483647 :: int) \<longrightarrow> i_2 \<le> (2147483647 :: int) \<longrightarrow> is_uint8 i_1 \<longrightarrow> is_uint32 i \<longrightarrow> is_uint32 i_2 \<longrightarrow> (i_2 \<le> (46340 :: int) \<longrightarrow> i \<le> (46340 :: int)) \<longrightarrow> (40 :: int) \<le> to_uint8 ((1 :: int) + i_1) \<or> to_uint32 (i - x) \<le> (1 :: int) \<longrightarrow> x \<le> (2147483647 :: int)"
  sorry
end
