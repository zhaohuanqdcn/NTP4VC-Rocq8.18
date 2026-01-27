theory rac_ArrayExec_map_updateqtvc
  imports "NTP4Verif.NTP4Verif"
begin
datatype 'a array = array'mk (length: "int") (elts: "int \<Rightarrow> 'a")
theorem map_update'vc:
  shows "True"
  sorry
end
