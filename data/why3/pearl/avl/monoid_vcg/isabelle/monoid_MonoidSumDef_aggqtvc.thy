theory monoid_MonoidSumDef_aggqtvc
  imports "NTP4Verif.NTP4Verif"
begin
typedecl  t
consts zero :: "t"
consts op :: "t \<Rightarrow> t \<Rightarrow> t"
axiomatization where assoc:   "op a (op b c) = op (op a b) c"
  for a :: "t"
  and b :: "t"
  and c :: "t"
axiomatization where neutral'0:   "op x zero = x"
  for x :: "t"
axiomatization where neutral'1:   "x = op zero x"
  for x :: "t"
theorem agg'vc:
  fixes s :: "'a list"
  assumes fact0: "\<not>int (length s) = (0 :: int)"
  shows "(0 :: int) \<le> (1 :: int)"
  and "(1 :: int) \<le> int (length s)"
  and "(0 :: int) \<le> int (length s)"
  and "length (drop (1 :: nat) s) < length s"
  sorry
end
