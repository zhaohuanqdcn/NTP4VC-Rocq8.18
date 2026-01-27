theory koda_ruskey_Lemmas_mem_appqtvc
  imports "NTP4Verif.NTP4Verif" "./koda_ruskey_KodaRuskey_Spec"
begin
typedecl  stack
fun mem_stack :: "int \<Rightarrow> forest list \<Rightarrow> _"
  where "mem_stack n (Nil :: forest list) = False" for n
      | "mem_stack n (Cons f tl) = (mem_forest n f \<or> mem_stack n tl)" for n f tl
theorem mem_app'vc:
  fixes n :: "int"
  fixes st1 :: "forest list"
  fixes st2 :: "forest list"
  assumes fact0: "mem_stack n (st1 @ st2)"
  shows "mem_stack n st1 \<or> mem_stack n st2"
  sorry
end
