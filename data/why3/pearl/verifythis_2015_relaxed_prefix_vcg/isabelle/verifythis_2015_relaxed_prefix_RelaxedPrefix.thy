theory verifythis_2015_relaxed_prefix_RelaxedPrefix
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref"
begin
typedecl  char
definition eq_array :: "char list \<Rightarrow> int \<Rightarrow> char list \<Rightarrow> int \<Rightarrow> int \<Rightarrow> _"
  where "eq_array a1 ofs1 a2 ofs2 len \<longleftrightarrow> (0 :: int) \<le> len \<and> (0 :: int) \<le> ofs1 \<and> (0 :: int) \<le> ofs2 \<and> ofs1 + len \<le> int (length a1) \<and> ofs2 + len \<le> int (length a2) \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < len \<longrightarrow> a1 ! nat (ofs1 + i) = a2 ! nat (ofs2 + i))" for a1 ofs1 a2 ofs2 len
definition is_relaxed_prefix :: "char list \<Rightarrow> char list \<Rightarrow> _"
  where "is_relaxed_prefix pat a \<longleftrightarrow> (let n :: int = int (length pat) in eq_array pat (0 :: int) a (0 :: int) n \<or> (\<exists>(i :: int). ((0 :: int) \<le> i \<and> i < n) \<and> eq_array pat (0 :: int) a (0 :: int) i \<and> eq_array pat (i + (1 :: int)) a i (n - i - (1 :: int))))" for pat a
end
