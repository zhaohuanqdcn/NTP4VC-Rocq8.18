theory koda_ruskey_Lemmas_sub_weaken1qtvc
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
inductive sub :: "forest list \<Rightarrow> forest \<Rightarrow> (int \<Rightarrow> color) \<Rightarrow> bool" where
   Sub_reflex: "sub (Cons f (Nil :: forest list)) f c" for f :: "forest" and c :: "int \<Rightarrow> color"
 | Sub_brother: "sub st f2 c \<Longrightarrow> sub st (N i f1 f2) c" for st :: "forest list" and f2 :: "forest" and c :: "int \<Rightarrow> color" and i :: "int" and f1 :: "forest"
 | Sub_append: "sub st f1 c \<Longrightarrow> c i = Black \<Longrightarrow> sub (st @ Cons f2 (Nil :: forest list)) (N i f1 f2) c" for st :: "forest list" and f1 :: "forest" and c :: "int \<Rightarrow> color" and i :: "int" and f2 :: "forest"
theorem sub_weaken1'vc:
  fixes i :: "int"
  fixes f1 :: "forest"
  fixes f2 :: "forest"
  fixes st :: "forest list"
  fixes f0 :: "forest"
  fixes c :: "int \<Rightarrow> color"
  assumes fact0: "sub (Cons (N i f1 f2) st) f0 c"
  shows "sub (Cons f2 st) f0 c"
  sorry
end
