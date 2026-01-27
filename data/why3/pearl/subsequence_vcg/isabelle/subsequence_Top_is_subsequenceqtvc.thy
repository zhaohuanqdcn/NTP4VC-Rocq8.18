theory subsequence_Top_is_subsequenceqtvc
  imports "NTP4Verif.NTP4Verif"
begin
typedecl  char
definition subsequence :: "char list \<Rightarrow> char list \<Rightarrow> (int \<Rightarrow> int) \<Rightarrow> _"
  where "subsequence v u f \<longleftrightarrow> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < int (length v) \<longrightarrow> ((0 :: int) \<le> f i \<and> f i < int (length u)) \<and> v ! nat i = u ! nat (f i)) \<and> (\<forall>(i :: int) (j :: int). (0 :: int) \<le> i \<and> i < j \<and> j < int (length v) \<longrightarrow> f i < f j)" for v u f
consts identity :: "int \<Rightarrow> int"
axiomatization where identity_def:   "identity y = y"
  for y :: "int"
theorem is_subsequence'vc:
  fixes v :: "char list"
  fixes u :: "char list"
  shows "\<forall>(i :: int) (j :: int) (f :: int \<Rightarrow> int). ((0 :: int) \<le> i \<and> i \<le> int (length v)) \<and> ((0 :: int) \<le> j \<and> j \<le> int (length u)) \<and> subsequence (drop (0 :: nat) (take (nat i - (0 :: nat)) v)) (drop (0 :: nat) (take (nat j - (0 :: nat)) u)) f \<and> (\<forall>(f1 :: int \<Rightarrow> int). subsequence v u f1 \<longrightarrow> i < int (length v) \<longrightarrow> j \<le> f1 i) \<longrightarrow> (let o1 :: int = int (length v) in (\<not>i = o1 \<longrightarrow> j < int (length u) \<longrightarrow> (if v ! nat i = u ! nat j then let o2 :: int = j + (1 :: int); o3 :: int = i + (1 :: int) in ((0 :: int) \<le> int (length u) - j \<and> int (length u) - o2 < int (length u) - j) \<and> ((0 :: int) \<le> o3 \<and> o3 \<le> int (length v)) \<and> ((0 :: int) \<le> o2 \<and> o2 \<le> int (length u)) \<and> subsequence (drop (0 :: nat) (take (nat o3 - (0 :: nat)) v)) (drop (0 :: nat) (take (nat o2 - (0 :: nat)) u)) (f(i := j)) \<and> (\<forall>(f1 :: int \<Rightarrow> int). subsequence v u f1 \<longrightarrow> o3 < int (length v) \<longrightarrow> o2 \<le> f1 o3) else let o2 :: int = j + (1 :: int) in ((0 :: int) \<le> int (length u) - j \<and> int (length u) - o2 < int (length u) - j) \<and> ((0 :: int) \<le> i \<and> i \<le> int (length v)) \<and> ((0 :: int) \<le> o2 \<and> o2 \<le> int (length u)) \<and> subsequence (drop (0 :: nat) (take (nat i - (0 :: nat)) v)) (drop (0 :: nat) (take (nat o2 - (0 :: nat)) u)) f \<and> (\<forall>(f1 :: int \<Rightarrow> int). subsequence v u f1 \<longrightarrow> i < int (length v) \<longrightarrow> o2 \<le> f1 i))) \<and> (\<forall>(result :: bool). (if i = o1 then result = True else if j < int (length u) then result = (if \<exists>(f1 :: int \<Rightarrow> int). subsequence v u f1 then True else False) else result = False) \<longrightarrow> result = True \<longleftrightarrow> (\<exists>(f1 :: int \<Rightarrow> int). subsequence v u f1)))"
  and "(0 :: int) \<le> (0 :: int)"
  and "(0 :: int) \<le> int (length v)"
  and "(0 :: int) \<le> (0 :: int)"
  and "(0 :: int) \<le> int (length u)"
  and "subsequence (drop (0 :: nat) (take ((0 :: nat) - (0 :: nat)) v)) (drop (0 :: nat) (take ((0 :: nat) - (0 :: nat)) u)) identity"
  and "\<forall>(f :: int \<Rightarrow> int). subsequence v u f \<longrightarrow> (0 :: int) < int (length v) \<longrightarrow> (0 :: int) \<le> f (0 :: int)"
  sorry
end
