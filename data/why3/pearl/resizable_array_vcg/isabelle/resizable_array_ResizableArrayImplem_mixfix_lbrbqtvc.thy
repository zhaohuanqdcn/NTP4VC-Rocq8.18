theory resizable_array_ResizableArrayImplem_mixfix_lbrbqtvc
  imports "NTP4Verif.NTP4Verif"
begin
typedecl 'a rarray
consts dummy :: "'a rarray \<Rightarrow> 'a"
consts length :: "'a rarray \<Rightarrow> int"
consts data :: "'a rarray \<Rightarrow> 'a list"
axiomatization where rarray'invariant'0:   "(0 :: int) \<le> length self"
  for self :: "'a rarray"
axiomatization where rarray'invariant'1:   "length self \<le> int (List.length (data self))"
  for self :: "'a rarray"
axiomatization where rarray'invariant'2:   "\<forall>(i :: int). length self \<le> i \<and> i < int (List.length (data self)) \<longrightarrow> data self ! nat i = dummy self"
  for self :: "'a rarray"
definition rarray'eq :: "'a rarray \<Rightarrow> 'a rarray \<Rightarrow> _"
  where "rarray'eq a b \<longleftrightarrow> dummy a = dummy b \<and> length a = length b \<and> data a = data b" for a b
axiomatization where rarray'inj:   "a = b"
 if "rarray'eq a b"
  for a :: "'a rarray"
  and b :: "'a rarray"
definition mixfix_lbrb :: "'a rarray \<Rightarrow> int \<Rightarrow> 'a"
  where "mixfix_lbrb r i = data r ! nat i" for r i
theorem mixfix_lbrb'vc:
  fixes i :: "int"
  fixes r :: "'a rarray"
  assumes fact0: "(0 :: int) \<le> i"
  assumes fact1: "i < length r"
  shows "(0 :: int) \<le> i"
  and "i < int (List.length (data r))"
  sorry
end
