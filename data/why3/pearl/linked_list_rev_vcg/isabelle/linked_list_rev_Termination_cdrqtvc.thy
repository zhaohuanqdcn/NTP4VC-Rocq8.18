theory linked_list_rev_Termination_cdrqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.int_NumOf"
begin
typedecl  loc
consts null :: "loc"
datatype  mem = mem'mk ("next": "loc \<Rightarrow> loc")
theorem cdr'vc:
  shows "True"
  sorry
end
