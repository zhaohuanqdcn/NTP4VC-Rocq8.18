theory udouble_UDouble_udiv_roundingqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.ieee_float_RoundingMode"
begin
typedecl  udouble
consts to_real :: "udouble \<Rightarrow> real"
consts uround :: "mode \<Rightarrow> real \<Rightarrow> udouble"
axiomatization where uround_exact:   "uround m (to_real x) = x"
  for m :: "mode"
  and x :: "udouble"
consts uzero :: "udouble"
axiomatization where to_real_uzero:   "to_real uzero = (0 :: Real.real)"
consts utwo :: "udouble"
axiomatization where to_real_utwo:   "to_real utwo = (2 :: Real.real)"
definition uadd :: "udouble \<Rightarrow> udouble \<Rightarrow> udouble"
  where "uadd x y = uround RNE (to_real x + to_real y)" for x y
definition usub :: "udouble \<Rightarrow> udouble \<Rightarrow> udouble"
  where "usub x y = uround RNE (to_real x - to_real y)" for x y
definition umul :: "udouble \<Rightarrow> udouble \<Rightarrow> udouble"
  where "umul x y = uround RNE (to_real x * to_real y)" for x y
definition udiv :: "udouble \<Rightarrow> udouble \<Rightarrow> udouble"
  where "udiv x y = uround RNE (to_real x / to_real y)" for x y
definition uminus :: "udouble \<Rightarrow> udouble"
  where "uminus x = uround RNE (-to_real x)" for x
theorem udiv_rounding'vc:
  fixes y :: "udouble"
  fixes x :: "udouble"
  assumes fact0: "\<not>y = uzero"
  shows "abs (to_real (udiv x y) - to_real x / to_real y) \<le> abs (to_real x / to_real y) * ((1 :: Real.real) / (9007199254740992) / ((1 :: Real.real) + (1 :: Real.real) / (9007199254740992))) + (1 :: Real.real) / (404804506614621236704990693437834614099113299528284236713802716054860679135990693783920767402874248990374155728633623822779617474771586953734026799881477019843034848553132722728933815484186432682479535356945490137124014966849385397236206711298319112681620113024717539104666829230461005064372655017292012526615415482186989568)"
  sorry
end
