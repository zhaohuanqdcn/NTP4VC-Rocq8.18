theory koda_ruskey_Lemmas_final_uniqueqtvc
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
definition unchanged :: "forest list \<Rightarrow> (int \<Rightarrow> color) \<Rightarrow> (int \<Rightarrow> color) \<Rightarrow> _"
  where "unchanged st c1 c2 \<longleftrightarrow> (\<forall>(i :: int). mem_stack i st \<longrightarrow> c1 i = c2 i)" for st c1 c2
fun inverse :: "forest list \<Rightarrow> (int \<Rightarrow> color) \<Rightarrow> (int \<Rightarrow> color) \<Rightarrow> _"
  where "inverse (Nil :: forest list) c1 c2 = True" for c1 c2
      | "inverse (Cons f st') c1 c2 = ((white_forest f c1 \<and> final_forest f c2 \<or> final_forest f c1 \<and> white_forest f c2) \<and> (if even_forest f then unchanged st' c1 c2 else inverse st' c1 c2))" for f st' c1 c2
fun any_stack :: "forest list \<Rightarrow> (int \<Rightarrow> color) \<Rightarrow> _"
  where "any_stack (Nil :: forest list) c = True" for c
      | "any_stack (Cons f st1) c = ((white_forest f c \<or> final_forest f c) \<and> any_stack st1 c)" for f st1 c
theorem final_unique'vc:
  fixes f :: "forest"
  fixes c1 :: "int \<Rightarrow> color"
  fixes c2 :: "int \<Rightarrow> color"
  fixes i :: "int"
  assumes fact0: "final_forest f c1"
  assumes fact1: "final_forest f c2"
  assumes fact2: "mem_forest i f"
  shows "c1 i = c2 i"
  sorry
end
