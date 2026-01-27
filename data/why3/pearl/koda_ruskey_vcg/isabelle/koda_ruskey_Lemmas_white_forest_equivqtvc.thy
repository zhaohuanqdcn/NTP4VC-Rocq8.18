theory koda_ruskey_Lemmas_white_forest_equivqtvc
  imports "NTP4Verif.NTP4Verif" "./koda_ruskey_KodaRuskey_Spec"
begin
typedecl  stack
fun mem_stack :: "int \<Rightarrow> forest list \<Rightarrow> _"
  where "mem_stack n (Nil :: forest list) = False" for n
      | "mem_stack n (Cons f tl) = (mem_forest n f \<or> mem_stack n tl)" for n f tl
fun size_stack :: "forest list \<Rightarrow> int"
  where "size_stack (Nil :: forest list) = (0 :: int)"
      | "size_stack (Cons f st1) = size_forest f + size_stack st1" for f st1
theorem white_forest_equiv'vc:
  fixes f :: "forest"
  fixes c :: "int \<Rightarrow> color"
  shows "white_forest f c \<longleftrightarrow> (\<forall>(i :: int). mem_forest i f \<longrightarrow> c i = White)"
  sorry
end
