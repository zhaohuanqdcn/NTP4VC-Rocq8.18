theory linked_list_rev_YetAnotherInPlaceRev_cdrqtvc
  imports "NTP4Verif.NTP4Verif"
begin
typedecl  loc
consts null :: "loc"
datatype  mem = mem'mk ("next": "loc \<Rightarrow> loc")
theorem cdr'vc:
  shows "True"
  sorry
end
