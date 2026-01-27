theory sumrange_ArraySum_sumqtvc
  imports "NTP4Verif.NTP4Verif"
begin
theorem sum'vc:
  fixes i :: "int"
  fixes j :: "int"
  fixes a :: "int list"
  assumes fact0: "(0 :: int) \<le> i"
  assumes fact1: "i \<le> j"
  assumes fact2: "j \<le> int (length a)"
  assumes fact3: "\<not>j \<le> i"
  shows "let o1 :: int = i + (1 :: int) in (((0 :: int) \<le> j - i \<and> j - o1 < j - i) \<and> (0 :: int) \<le> o1 \<and> o1 \<le> j \<and> j \<le> int (length a)) \<and> (0 :: int) \<le> i \<and> i < int (length a)"
  sorry
end
