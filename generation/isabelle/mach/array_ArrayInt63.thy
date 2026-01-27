theory array_ArrayInt63
  imports "NTP4Verif.NTP4Verif"
begin
typedecl  array63
consts elts :: "array63 \<Rightarrow> int list"
consts size :: "array63 \<Rightarrow> int"
axiomatization where array63'invariant'0:   "(0 :: int) \<le> size self"
  for self :: "array63"
axiomatization where array63'invariant'1:   "size self = int (length (elts self))"
  for self :: "array63"
axiomatization where array63'invariant'2:   "int (length (elts self)) \<le> sint int'63_max"
  for self :: "array63"
axiomatization where array63'invariant'3:   "\<forall>(i :: int). (0 :: int) \<le> i \<and> i < int (length (elts self)) \<longrightarrow> int'63_in_bounds (elts self ! nat i)"
  for self :: "array63"
end
