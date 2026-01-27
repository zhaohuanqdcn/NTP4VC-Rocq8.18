theory renorm_factor_Why3_ide_VCrenorm_factor_call_sqrtf_pre_finite_arg_goal0
  imports "NTP4Verif.NTP4Verif" "Why3STD.Qed_Qed" "Why3STD.Cmath_Cmath" "Why3STD.Cfloat_Cfloat"
begin
theorem goal0:
  fixes r :: "real"
  assumes fact0: "(5368709 :: Real.real) / (536870912 :: Real.real) < r"
  assumes fact1: "r < (100 :: Real.real)"
  assumes fact2: "is_float32 r"
  assumes fact3: "r \<le> (5368709 :: Real.real) / (8388608 :: Real.real) \<or> (25 :: Real.real) / (16 :: Real.real) \<le> r"
  shows "is_finite32 r"
  sorry
end
