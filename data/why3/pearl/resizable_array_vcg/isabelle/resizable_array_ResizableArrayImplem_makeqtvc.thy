theory resizable_array_ResizableArrayImplem_makeqtvc
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
theorem make'vc:
  fixes len :: "int"
  fixes dummy1 :: "'a"
  assumes fact0: "(0 :: int) \<le> len"
  shows "(0 :: int) \<le> len"
  and "\<forall>(o1 :: 'a list). (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < len \<longrightarrow> o1 ! nat i = dummy1) \<and> int (List.length o1) = len \<longrightarrow> (((0 :: int) \<le> len \<and> len \<le> int (List.length o1)) \<and> (\<forall>(i :: int). len \<le> i \<and> i < int (List.length o1) \<longrightarrow> o1 ! nat i = dummy1)) \<and> (\<forall>(result :: 'a rarray). dummy result = dummy1 \<and> length result = len \<and> data result = o1 \<longrightarrow> dummy result = dummy1 \<and> length result = len \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < len \<longrightarrow> data result ! nat i = dummy1))"
  sorry
end
