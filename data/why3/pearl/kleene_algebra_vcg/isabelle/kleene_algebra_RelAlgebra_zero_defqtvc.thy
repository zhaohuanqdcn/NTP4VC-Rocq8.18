theory kleene_algebra_RelAlgebra_zero_defqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.map_Const" "Why3STD.map_MapExt"
begin
typedecl  a
typedecl  t
theorem zero_def'vc:
  fixes x :: "a"
  fixes x1 :: "a"
  shows "\<not>(x, x1) \<in> {}"
  sorry
end
