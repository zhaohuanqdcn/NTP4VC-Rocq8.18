theory my_lrand48_Why3_ide_VCmy_lrand48_post_lower_goal0
  imports "NTP4Verif.NTP4Verif" "Why3STD.Qed_Qed" "Why3STD.Cint_Cint" "Why3STD.Cbits_Cbits"
begin
theorem goal0:
  fixes t :: "int \<Rightarrow> int"
  shows "let x :: int = t (0 :: int); x_1 :: int = t (1 :: int); x_2 :: int = t (2 :: int) in is_uint16 x \<longrightarrow> is_uint16 x_1 \<longrightarrow> is_uint16 x_2 \<longrightarrow> is_uint64 x_2 \<longrightarrow> (0 :: int) \<le> to_sint32 (to_uint64 (to_uint64 ((11 :: int) + to_uint64 ((25214903917 :: int) * lor (to_uint64 (lsl x (32 :: int))) (lor (to_uint64 (lsl x_1 (16 :: int))) x_2))) cmod (281474976710656 :: int)) cdiv (131072 :: int))"
  sorry
end
