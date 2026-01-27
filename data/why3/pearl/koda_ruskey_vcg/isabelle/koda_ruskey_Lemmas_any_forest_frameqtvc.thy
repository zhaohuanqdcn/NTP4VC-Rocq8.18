theory koda_ruskey_Lemmas_any_forest_frameqtvc
  imports "NTP4Verif.NTP4Verif" "./koda_ruskey_KodaRuskey_Spec"
begin
typedecl  stack
fun mem_stack :: "int \<Rightarrow> forest list \<Rightarrow> _"
  where "mem_stack n (Nil :: forest list) = False" for n
      | "mem_stack n (Cons f tl) = (mem_forest n f \<or> mem_stack n tl)" for n f tl
fun size_stack :: "forest list \<Rightarrow> int"
  where "size_stack (Nil :: forest list) = (0 :: int)"
      | "size_stack (Cons f st1) = size_forest f + size_stack st1" for f st1
fun even_forest :: "forest \<Rightarrow> _"
  where "even_forest (E :: forest) = False"
      | "even_forest (N x f1 f2) = (\<not>even_forest f1 \<or> even_forest f2)" for x f1 f2
fun final_forest :: "forest \<Rightarrow> (int \<Rightarrow> color) \<Rightarrow> _"
  where "final_forest (E :: forest) c = True" for c
      | "final_forest (N i f1 f2) c = (c i = Black \<and> final_forest f1 c \<and> (if \<not>even_forest f1 then white_forest f2 c else final_forest f2 c))" for i f1 f2 c
definition any_forest :: "forest \<Rightarrow> (int \<Rightarrow> color) \<Rightarrow> _"
  where "any_forest f c \<longleftrightarrow> white_forest f c \<or> final_forest f c" for f c
theorem any_forest_frame'vc:
  fixes f :: "forest"
  fixes c1 :: "int \<Rightarrow> color"
  fixes c2 :: "int \<Rightarrow> color"
  assumes fact0: "\<forall>(i :: int). mem_forest i f \<longrightarrow> c1 i = c2 i"
  shows "final_forest f c1 \<longrightarrow> final_forest f c2"
  and "white_forest f c1 \<longrightarrow> white_forest f c2"
  sorry
end
