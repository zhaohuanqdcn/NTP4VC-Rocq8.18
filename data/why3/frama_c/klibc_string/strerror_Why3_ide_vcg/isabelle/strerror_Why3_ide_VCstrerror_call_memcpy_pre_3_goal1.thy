theory strerror_Why3_ide_VCstrerror_call_memcpy_pre_3_goal1
  imports "NTP4Verif.NTP4Verif" "Why3STD.Qed_Qed" "Why3STD.Memory_Memory" "Why3STD.Cint_Cint"
begin
theorem goal1:
  fixes i :: "int"
  fixes i_1 :: "int"
  fixes t :: "int \<Rightarrow> int"
  fixes t_1 :: "addr \<Rightarrow> int"
  shows "let x :: int = to_uint32 i in to_uint32 (i_1 cdiv (10 :: int)) = (0 :: int) \<longrightarrow> (0 :: int) < x \<longrightarrow> linked t \<longrightarrow> sconst t_1 \<longrightarrow> is_uint32 i_1 \<longrightarrow> x \<le> (26 :: int)"
  sorry
end
