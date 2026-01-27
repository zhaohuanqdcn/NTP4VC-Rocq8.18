theory resizable_array_ResizableArrayImplem_mixfix_lbrblsmnqtvc
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
theorem mixfix_lbrblsmn'vc:
  fixes i :: "int"
  fixes r :: "'a rarray"
  fixes v :: "'a"
  assumes fact0: "(0 :: int) \<le> i"
  assumes fact1: "i < length r"
  shows "let o1 :: 'a list = data r in ((0 :: int) \<le> i \<and> i < int (List.length o1)) \<and> (\<forall>(r1 :: 'a rarray). List.length (o1[nat i := v]) = List.length o1 \<longrightarrow> List.length (o1[nat i := v]) = List.length (data r) \<longrightarrow> nth (o1[nat i := v]) o nat = (nth o1 o nat)(i := v) \<longrightarrow> (((0 :: int) \<le> length r \<and> length r \<le> int (List.length (o1[nat i := v]))) \<and> (\<forall>(i1 :: int). length r \<le> i1 \<and> i1 < int (List.length (o1[nat i := v])) \<longrightarrow> o1[nat i := v] ! nat i1 = dummy r)) \<and> (o1[nat i := v] = data r1 \<and> length r = length r1 \<and> dummy r = dummy r1 \<longrightarrow> nth (data r1) o nat = (nth (data r) o nat)(i := v)))"
  sorry
end
