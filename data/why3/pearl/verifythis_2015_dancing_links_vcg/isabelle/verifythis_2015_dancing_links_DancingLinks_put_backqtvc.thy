theory verifythis_2015_dancing_links_DancingLinks_put_backqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref"
begin
typedecl  dll
consts prev :: "dll \<Rightarrow> int list"
consts "next" :: "dll \<Rightarrow> int list"
consts n :: "dll \<Rightarrow> int"
axiomatization where dll'invariant'0:   "length (prev self) = length (next self)"
  for self :: "dll"
axiomatization where dll'invariant'1:   "int (length (next self)) = n self"
  for self :: "dll"
definition dll'eq :: "dll \<Rightarrow> dll \<Rightarrow> _"
  where "dll'eq a b \<longleftrightarrow> prev a = prev b \<and> next a = next b \<and> n a = n b" for a b
axiomatization where dll'inj:   "a = b"
 if "dll'eq a b"
  for a :: "dll"
  and b :: "dll"
definition valid_in :: "dll \<Rightarrow> int \<Rightarrow> _"
  where "valid_in l i \<longleftrightarrow> ((0 :: int) \<le> i \<and> i < n l) \<and> ((0 :: int) \<le> prev l ! nat i \<and> prev l ! nat i < n l) \<and> ((0 :: int) \<le> next l ! nat i \<and> next l ! nat i < n l) \<and> next l ! nat (prev l ! nat i) = i \<and> prev l ! nat (next l ! nat i) = i" for l i
definition valid_out :: "dll \<Rightarrow> int \<Rightarrow> _"
  where "valid_out l i \<longleftrightarrow> ((0 :: int) \<le> i \<and> i < n l) \<and> ((0 :: int) \<le> prev l ! nat i \<and> prev l ! nat i < n l) \<and> ((0 :: int) \<le> next l ! nat i \<and> next l ! nat i < n l) \<and> next l ! nat (prev l ! nat i) = next l ! nat i \<and> prev l ! nat (next l ! nat i) = prev l ! nat i" for l i
definition is_list :: "dll \<Rightarrow> int list \<Rightarrow> _"
  where "is_list l s \<longleftrightarrow> (\<forall>(k :: int). (0 :: int) \<le> k \<and> k < int (length s) \<longrightarrow> ((0 :: int) \<le> s ! nat k \<and> s ! nat k < n l) \<and> prev l ! nat (s ! nat k) = s ! nat (if k = (0 :: int) then int (length s) - (1 :: int) else k - (1 :: int)) \<and> next l ! nat (s ! nat k) = s ! nat (if k = int (length s) - (1 :: int) then 0 :: int else k + (1 :: int)) \<and> (\<forall>(k' :: int). (0 :: int) \<le> k' \<and> k' < int (length s) \<longrightarrow> \<not>k = k' \<longrightarrow> \<not>s ! nat k = s ! nat k'))" for l s
theorem put_back'vc:
  fixes l :: "dll"
  fixes i :: "int"
  fixes s :: "int list"
  assumes fact0: "valid_out l i"
  assumes fact1: "is_list l s"
  assumes fact2: "(0 :: int) < int (length s)"
  assumes fact3: "next l ! nat i = s ! (0 :: nat)"
  assumes fact4: "\<not>s ! (0 :: nat) = i"
  shows "let o1 :: int list = next l in ((0 :: int) \<le> i \<and> i < int (length o1)) \<and> (let o2 :: int = o1 ! nat i; o3 :: int list = prev l in ((0 :: int) \<le> o2 \<and> o2 < int (length o3)) \<and> (length (o3[nat o2 := i]) = length o3 \<longrightarrow> length (o3[nat o2 := i]) = length (prev l) \<longrightarrow> nth (o3[nat o2 := i]) o nat = (nth o3 o nat)(o2 := i) \<longrightarrow> ((0 :: int) \<le> i \<and> i < int (length (o3[nat o2 := i]))) \<and> (let o4 :: int = o3[nat o2 := i] ! nat i in ((0 :: int) \<le> o4 \<and> o4 < int (length (next l))) \<and> (\<forall>(l1 :: dll). length ((next l)[nat o4 := i]) = length (next l) \<longrightarrow> length ((next l)[nat o4 := i]) = length (next l) \<longrightarrow> nth ((next l)[nat o4 := i]) o nat = (nth (next l) o nat)(o4 := i) \<longrightarrow> (length (o3[nat o2 := i]) = length ((next l)[nat o4 := i]) \<and> int (length ((next l)[nat o4 := i])) = n l) \<and> (n l = n l1 \<and> (next l)[nat o4 := i] = next l1 \<and> o3[nat o2 := i] = prev l1 \<longrightarrow> valid_in l1 i \<and> is_list l1 (Cons i s))))))"
  sorry
end
