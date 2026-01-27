theory find_FIND
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref" "Why3STD.map_MapEq" "Why3STD.map_MapExchange" "Why3STD.map_MapPermut"
begin
consts x_N :: "int"
consts f :: "int"
axiomatization where f_N_range'0:   "(1 :: int) \<le> f"
axiomatization where f_N_range'1:   "f \<le> x_N"
definition found :: "int list \<Rightarrow> _"
  where "found a \<longleftrightarrow> (\<forall>(p :: int) (q :: int). (1 :: int) \<le> p \<and> p \<le> f \<and> f \<le> q \<and> q \<le> x_N \<longrightarrow> a ! nat p \<le> a ! nat f \<and> a ! nat f \<le> a ! nat q)" for a
definition m_invariant :: "int \<Rightarrow> int list \<Rightarrow> _"
  where "m_invariant m a \<longleftrightarrow> m \<le> f \<and> (\<forall>(p :: int) (q :: int). (1 :: int) \<le> p \<and> p < m \<and> m \<le> q \<and> q \<le> x_N \<longrightarrow> a ! nat p \<le> a ! nat q)" for m a
definition n_invariant :: "int \<Rightarrow> int list \<Rightarrow> _"
  where "n_invariant n a \<longleftrightarrow> f \<le> n \<and> (\<forall>(p :: int) (q :: int). (1 :: int) \<le> p \<and> p \<le> n \<and> n < q \<and> q \<le> x_N \<longrightarrow> a ! nat p \<le> a ! nat q)" for n a
definition i_invariant :: "int \<Rightarrow> int \<Rightarrow> int \<Rightarrow> int \<Rightarrow> int \<Rightarrow> int list \<Rightarrow> _"
  where "i_invariant m n i q r a \<longleftrightarrow> m \<le> i \<and> (\<forall>(p :: int). (1 :: int) \<le> p \<and> p < i \<longrightarrow> a ! nat p \<le> r) \<and> (i \<le> n \<longrightarrow> (i \<le> q \<and> q \<le> n) \<and> r \<le> a ! nat q)" for m n i q r a
definition j_invariant :: "int \<Rightarrow> int \<Rightarrow> int \<Rightarrow> int \<Rightarrow> int \<Rightarrow> int list \<Rightarrow> _"
  where "j_invariant m n j p r a \<longleftrightarrow> j \<le> n \<and> (\<forall>(q :: int). j < q \<and> q \<le> x_N \<longrightarrow> r \<le> a ! nat q) \<and> (m \<le> j \<longrightarrow> (m \<le> p \<and> p \<le> j) \<and> a ! nat p \<le> r)" for m n j p r a
definition "termination" :: "int \<Rightarrow> int \<Rightarrow> int \<Rightarrow> int \<Rightarrow> int \<Rightarrow> int list \<Rightarrow> _"
  where "termination i j i0 j0 r a \<longleftrightarrow> i0 < i \<and> j < j0 \<or> (i \<le> f \<and> f \<le> j) \<and> a ! nat f = r" for i j i0 j0 r a
end
