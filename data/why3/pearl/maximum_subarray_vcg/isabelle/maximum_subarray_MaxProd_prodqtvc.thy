theory maximum_subarray_MaxProd_prodqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref"
begin
theorem prod'vc:
  fixes lo :: "int"
  fixes hi :: "int"
  fixes a :: "int list"
  assumes fact0: "(0 :: int) \<le> lo"
  assumes fact1: "lo \<le> hi"
  assumes fact2: "hi \<le> int (length a)"
  assumes fact3: "\<not>lo = hi"
  shows "let o1 :: int = hi - (1 :: int) in ((0 :: int) \<le> o1 \<and> o1 < int (length a)) \<and> (let o2 :: int = hi - (1 :: int) in ((0 :: int) \<le> hi - lo \<and> o2 - lo < hi - lo) \<and> (0 :: int) \<le> lo \<and> lo \<le> o2 \<and> o2 \<le> int (length a))"
  sorry
end
