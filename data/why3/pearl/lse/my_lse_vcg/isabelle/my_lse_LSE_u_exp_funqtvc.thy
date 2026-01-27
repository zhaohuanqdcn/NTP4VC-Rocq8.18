theory my_lse_LSE_u_exp_funqtvc
  imports "NTP4Verif.NTP4Verif" "../../lib/isabelle/udouble_UDouble" "Why3STD.ieee_float_RoundingMode" "../../lib/isabelle/my_exp_log_ExpLogLemmas" "../../lib/isabelle/my_exp_log_ExpLogApprox" "../../lib/isabelle/sum_real_Sum" "../../lib/isabelle/my_sum_Sum"
begin
consts exp_fun :: "(int \<Rightarrow> udouble) \<Rightarrow> int \<Rightarrow> real"
axiomatization where exp_fun'def:   "exp_fun a i = exp (real_fun a i)"
  for a :: "int \<Rightarrow> udouble"
  and i :: "int"
theorem u_exp_fun'vc:
  shows "True"
  sorry
end
