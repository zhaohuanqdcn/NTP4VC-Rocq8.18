theory koda_ruskey_KodaRuskey_Spec_size_forest_nonnegqtvc
  imports "NTP4Verif.NTP4Verif"
begin
datatype  color = White | Black
datatype  forest = E | N "int" "forest" "forest"
typedecl  coloring
fun size_forest :: "forest \<Rightarrow> int"
  where "size_forest (E :: forest) = (0 :: int)"
      | "size_forest (N x f1 f2) = (1 :: int) + size_forest f1 + size_forest f2" for x f1 f2
theorem size_forest_nonneg'vc:
  fixes f :: "forest"
  shows "(0 :: int) \<le> size_forest f"
  sorry
end
