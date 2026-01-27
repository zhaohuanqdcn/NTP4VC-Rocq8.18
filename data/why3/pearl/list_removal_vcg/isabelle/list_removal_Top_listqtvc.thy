theory list_removal_Top_listqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref"
begin
typedecl  loc
typedecl  mem
consts null :: "loc"
consts head :: "loc"
consts entry :: "loc"
axiomatization where head_is_not_null:   "\<not>head = null"
axiomatization where entry_is_not_null:   "\<not>entry = null"
axiomatization where head_is_not_entry:   "\<not>head = entry"
theorem list'vc:
  fixes n :: "int"
  fixes x :: "loc"
  assumes fact0: "(0 :: int) \<le> n"
  assumes fact1: "\<not>n = (0 :: int)"
  assumes fact2: "\<not>x = null"
  shows "let o1 :: int = n - (1 :: int) in ((0 :: int) \<le> n \<and> o1 < n) \<and> (0 :: int) \<le> o1"
  sorry
end
