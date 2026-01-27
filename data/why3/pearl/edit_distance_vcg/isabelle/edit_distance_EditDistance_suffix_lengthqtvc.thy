theory edit_distance_EditDistance_suffix_lengthqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref" "./edit_distance_MyWord"
begin
consts suffix :: "edit_distance_MyWord.char list \<Rightarrow> int \<Rightarrow> edit_distance_MyWord.char list"
axiomatization where suffix_nil:   "suffix a (int (length a)) = (Nil :: edit_distance_MyWord.char list)"
  for a :: "edit_distance_MyWord.char list"
axiomatization where suffix_cons:   "suffix a i = Cons (a ! nat i) (suffix a (i + (1 :: int)))"
 if "(0 :: int) \<le> i"
 and "i < int (length a)"
  for i :: "int"
  and a :: "edit_distance_MyWord.char list"
theorem suffix_length'vc:
  fixes i :: "int"
  fixes a :: "edit_distance_MyWord.char list"
  assumes fact0: "(0 :: int) \<le> i"
  assumes fact1: "i \<le> int (length a)"
  shows "int (length (suffix a i)) = int (length a) - i"
  sorry
end
