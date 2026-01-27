theory resizable_array_ResizableArrayImplem_resizeqtvc
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
theorem resize'vc:
  fixes len :: "int"
  fixes r :: "'a rarray"
  assumes fact0: "(0 :: int) \<le> len"
  shows "let n :: int = int (List.length (data r)) in if n < len then let o1 :: int = max len ((2 :: int) * n) in (0 :: int) \<le> o1 \<and> (\<forall>(a :: 'a list). (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < o1 \<longrightarrow> a ! nat i = dummy r) \<and> int (List.length a) = o1 \<longrightarrow> (let o2 :: 'a list = data r in (((0 :: int) \<le> (0 :: int) \<and> (0 :: int) \<le> n \<and> (0 :: int) + n \<le> int (List.length o2)) \<and> (0 :: int) \<le> (0 :: int) \<and> (0 :: int) + n \<le> int (List.length a)) \<and> (\<forall>(a1 :: 'a list). List.length a1 = List.length a \<longrightarrow> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < (0 :: int) \<or> (0 :: int) + n \<le> i \<and> i < int (List.length a1) \<longrightarrow> a1 ! nat i = a ! nat i) \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < (0 :: int) + n \<longrightarrow> a1 ! nat i = o2 ! nat ((0 :: int) + i - (0 :: int))) \<longrightarrow> (\<forall>(r1 :: 'a rarray). (((0 :: int) \<le> len \<and> len \<le> int (List.length a1)) \<and> (\<forall>(i :: int). len \<le> i \<and> i < int (List.length a1) \<longrightarrow> a1 ! nat i = dummy r)) \<and> (a1 = data r1 \<and> len = length r1 \<and> dummy r = dummy r1 \<longrightarrow> length r1 = len \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < length r \<longrightarrow> i < len \<longrightarrow> mixfix_lbrb r1 i = mixfix_lbrb r i)))))) else let o1 :: int = n - len; o2 :: 'a list = data r in ((0 :: int) \<le> len \<and> (0 :: int) \<le> o1 \<and> len + o1 \<le> int (List.length o2)) \<and> (\<forall>(r_data :: 'a list). List.length r_data = List.length o2 \<longrightarrow> List.length r_data = List.length (data r) \<longrightarrow> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < len \<or> len + o1 \<le> i \<and> i < int (List.length r_data) \<longrightarrow> r_data ! nat i = o2 ! nat i) \<and> (\<forall>(i :: int). len \<le> i \<and> i < len + o1 \<longrightarrow> r_data ! nat i = dummy r) \<longrightarrow> (\<forall>(r1 :: 'a rarray). (((0 :: int) \<le> len \<and> len \<le> int (List.length r_data)) \<and> (\<forall>(i :: int). len \<le> i \<and> i < int (List.length r_data) \<longrightarrow> r_data ! nat i = dummy r)) \<and> (r_data = data r1 \<and> len = length r1 \<and> dummy r = dummy r1 \<longrightarrow> length r1 = len \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < length r \<longrightarrow> i < len \<longrightarrow> mixfix_lbrb r1 i = mixfix_lbrb r i))))"
  sorry
end
