theory verifythis_2024_challenge1_Top_frame_permutation_pairqtvc
  imports "NTP4Verif.NTP4Verif"
begin
definition permutation :: "int \<Rightarrow> int list \<Rightarrow> _"
  where "permutation l p \<longleftrightarrow> ((0 :: int) \<le> l \<and> l \<le> int (length p)) \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < l \<longrightarrow> (0 :: int) \<le> p ! nat i \<and> p ! nat i < l) \<and> (\<forall>(i :: int) (j :: int). (0 :: int) \<le> i \<and> i < l \<longrightarrow> (0 :: int) \<le> j \<and> j < l \<longrightarrow> \<not>i = j \<longrightarrow> \<not>p ! nat i = p ! nat j)" for l p
definition permutation_pair :: "int \<Rightarrow> int list \<Rightarrow> int list \<Rightarrow> _"
  where "permutation_pair l p invp \<longleftrightarrow> permutation l p \<and> permutation l invp \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < l \<longrightarrow> p ! nat (invp ! nat i) = i) \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < l \<longrightarrow> invp ! nat (p ! nat i) = i)" for l p invp
consts identity :: "int \<Rightarrow> int list"
axiomatization where identity'spec'1:   "int (length (identity l)) = l"
 if "(0 :: int) < l"
  for l :: "int"
axiomatization where identity'spec'0:   "identity l ! nat i = i"
 if "(0 :: int) < l"
 and "(0 :: int) \<le> i"
 and "i < l"
  for l :: "int"
  and i :: "int"
axiomatization where identity'spec:   "permutation_pair l (identity l) (identity l)"
 if "(0 :: int) < l"
  for l :: "int"
typedecl  elt
definition valid_chunk :: "elt list \<Rightarrow> int \<Rightarrow> int \<Rightarrow> _"
  where "valid_chunk a ofs len \<longleftrightarrow> (0 :: int) \<le> ofs \<and> ofs \<le> ofs + len \<and> ofs + len \<le> int (length a)" for a ofs len
definition copy :: "elt list \<Rightarrow> elt list \<Rightarrow> int \<Rightarrow> int \<Rightarrow> _"
  where "copy src dst ofs len \<longleftrightarrow> valid_chunk src ofs len \<and> length src = length dst \<and> (\<forall>(i :: int). ofs \<le> i \<and> i < ofs + len \<longrightarrow> dst ! nat i = src ! nat i)" for src dst ofs len
definition copy_to :: "elt list \<Rightarrow> elt list \<Rightarrow> int \<Rightarrow> int \<Rightarrow> int \<Rightarrow> _"
  where "copy_to src dst ofss ofsd len \<longleftrightarrow> valid_chunk src ofss len \<and> valid_chunk dst ofsd len \<and> length src = length dst \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < len \<longrightarrow> dst ! nat (ofsd + i) = src ! nat (ofss + i)) \<and> (\<forall>(i :: int). ofsd \<le> i \<and> i < ofsd + len \<longrightarrow> dst ! nat i = src ! nat (i + (ofss - ofsd)))" for src dst ofss ofsd len
definition copy_perm :: "elt list \<Rightarrow> elt list \<Rightarrow> int \<Rightarrow> int list \<Rightarrow> int list \<Rightarrow> _"
  where "copy_perm src dst size p invp \<longleftrightarrow> valid_chunk src (0 :: int) size \<and> length src = length dst \<and> permutation_pair size p invp \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < size \<longrightarrow> (0 :: int) \<le> p ! nat i \<and> p ! nat i < size) \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < size \<longrightarrow> (0 :: int) \<le> invp ! nat i \<and> invp ! nat i < size) \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < size \<longrightarrow> dst ! nat i = src ! nat (p ! nat i)) \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < size \<longrightarrow> src ! nat i = dst ! nat (invp ! nat i))" for src dst size p invp
definition copy_subsegment :: "elt list \<Rightarrow> elt list \<Rightarrow> int \<Rightarrow> int \<Rightarrow> int \<Rightarrow> int \<Rightarrow> int list \<Rightarrow> int list \<Rightarrow> int list \<Rightarrow> int list \<Rightarrow> _"
  where "copy_subsegment src dst s k l j sigma tau p invp \<longleftrightarrow> (let start :: int = s * (k * l); starts :: int = start + sigma ! nat j * k; startd :: int = start + tau ! nat (sigma ! nat j) * k in copy_to src dst starts startd k \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < k \<longrightarrow> p ! nat (startd + i) = starts + i) \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < k \<longrightarrow> invp ! nat (starts + i) = startd + i))" for src dst s k l j sigma tau p invp
definition frame :: "'a list \<Rightarrow> 'a list \<Rightarrow> int \<Rightarrow> int \<Rightarrow> _"
  where "frame a1 a2 ofs len \<longleftrightarrow> length a2 = length a1 \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < ofs \<longrightarrow> a2 ! nat i = a1 ! nat i) \<and> (\<forall>(i :: int). ofs + len \<le> i \<and> i < int (length a2) \<longrightarrow> a2 ! nat i = a1 ! nat i)" for a1 a2 ofs len
theorem frame_permutation_pair'vc:
  fixes op :: "int list"
  fixes p :: "int list"
  fixes oinvp :: "int list"
  fixes invp :: "int list"
  fixes start :: "int"
  fixes start1 :: "int"
  fixes k :: "int"
  fixes start2 :: "int"
  assumes fact0: "length op = length p"
  assumes fact1: "length p = length oinvp"
  assumes fact2: "length oinvp = length invp"
  assumes fact3: "(0 :: int) \<le> start"
  assumes fact4: "start \<le> start1"
  assumes fact5: "start1 \<le> start1 + k"
  assumes fact6: "start1 + k \<le> int (length p)"
  assumes fact7: "(0 :: int) \<le> start"
  assumes fact8: "start \<le> start2"
  assumes fact9: "start2 \<le> start2 + k"
  assumes fact10: "start2 + k \<le> int (length p)"
  assumes fact11: "permutation_pair start op oinvp"
  assumes fact12: "frame op p start1 k"
  assumes fact13: "frame oinvp invp start2 k"
  shows "permutation_pair start p invp"
  sorry
end
