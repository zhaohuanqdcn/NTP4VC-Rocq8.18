theory resizable_array_ResizableArrayImplem_appendqtvc
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
theorem append'vc:
  fixes r1 :: "'a rarray"
  fixes r2 :: "'a rarray"
  shows "let n1 :: int = length r1; o1 :: int = length r1 + length r2 in (0 :: int) \<le> o1 \<and> (\<forall>(r11 :: 'a rarray). dummy r1 = dummy r11 \<longrightarrow> length r11 = o1 \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < length r1 \<longrightarrow> i < o1 \<longrightarrow> mixfix_lbrb r11 i = mixfix_lbrb r1 i) \<longrightarrow> (let o2 :: int = length r2; o3 :: 'a list = data r11; o4 :: 'a list = data r2 in (((0 :: int) \<le> (0 :: int) \<and> (0 :: int) \<le> o2 \<and> (0 :: int) + o2 \<le> int (List.length o4)) \<and> (0 :: int) \<le> n1 \<and> n1 + o2 \<le> int (List.length o3)) \<and> (\<forall>(r12 :: 'a rarray) (r1_data :: 'a list). List.length r1_data = List.length o3 \<longrightarrow> List.length r1_data = List.length (data r11) \<longrightarrow> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < n1 \<or> n1 + o2 \<le> i \<and> i < int (List.length r1_data) \<longrightarrow> r1_data ! nat i = o3 ! nat i) \<and> (\<forall>(i :: int). n1 \<le> i \<and> i < n1 + o2 \<longrightarrow> r1_data ! nat i = o4 ! nat ((0 :: int) + i - n1)) \<longrightarrow> (((0 :: int) \<le> length r11 \<and> length r11 \<le> int (List.length r1_data)) \<and> (\<forall>(i :: int). length r11 \<le> i \<and> i < int (List.length r1_data) \<longrightarrow> r1_data ! nat i = dummy r11)) \<and> (r1_data = data r12 \<and> length r11 = length r12 \<and> dummy r11 = dummy r12 \<longrightarrow> length r12 = length r1 + length r2 \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < length r12 \<longrightarrow> (i < length r1 \<longrightarrow> mixfix_lbrb r12 i = mixfix_lbrb r1 i) \<and> (length r1 \<le> i \<longrightarrow> mixfix_lbrb r12 i = mixfix_lbrb r2 (i - length r1)))))))"
  sorry
end
