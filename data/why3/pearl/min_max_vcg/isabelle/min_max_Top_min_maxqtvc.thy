theory min_max_Top_min_maxqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref"
begin
definition is_min :: "int \<Rightarrow> int list \<Rightarrow> int \<Rightarrow> int \<Rightarrow> _"
  where "is_min m a lo hi \<longleftrightarrow> (\<exists>(i :: int). (lo \<le> i \<and> i < hi \<and> hi \<le> int (length a)) \<and> a ! nat i = m) \<and> (\<forall>(i :: int). lo \<le> i \<and> i < hi \<longrightarrow> m \<le> a ! nat i)" for m a lo hi
definition is_max :: "int \<Rightarrow> int list \<Rightarrow> int \<Rightarrow> int \<Rightarrow> _"
  where "is_max m a lo hi \<longleftrightarrow> (\<exists>(i :: int). (lo \<le> i \<and> i < hi \<and> hi \<le> int (length a)) \<and> a ! nat i = m) \<and> (\<forall>(i :: int). lo \<le> i \<and> i < hi \<longrightarrow> a ! nat i \<le> m)" for m a lo hi
theorem min_max'vc:
  fixes a :: "int list"
  assumes fact0: "(1 :: int) \<le> int (length a)"
  shows "(0 :: int) \<le> (0 :: int)"
  and "(0 :: int) < int (length a)"
  and "let o1 :: int = a ! (0 :: nat) in ((0 :: int) \<le> (0 :: int) \<and> (0 :: int) < int (length a)) \<and> (let o2 :: int = a ! (0 :: nat); o3 :: int = int (length a) - (1 :: int) in ((1 :: int) \<le> o3 + (1 :: int) \<longrightarrow> (is_min o1 a (0 :: int) (1 :: int) \<and> is_max o2 a (0 :: int) (1 :: int)) \<and> (\<forall>(max :: int) (min :: int). (\<forall>(i :: int). ((1 :: int) \<le> i \<and> i \<le> o3) \<and> is_min min a (0 :: int) i \<and> is_max max a (0 :: int) i \<longrightarrow> ((0 :: int) \<le> i \<and> i < int (length a)) \<and> (if a ! nat i < min then ((0 :: int) \<le> i \<and> i < int (length a)) \<and> ((0 :: int) \<le> i \<and> i < int (length a)) \<and> (if max < a ! nat i then ((0 :: int) \<le> i \<and> i < int (length a)) \<and> is_min (a ! nat i) a (0 :: int) (i + (1 :: int)) \<and> is_max (a ! nat i) a (0 :: int) (i + (1 :: int)) else is_min (a ! nat i) a (0 :: int) (i + (1 :: int)) \<and> is_max max a (0 :: int) (i + (1 :: int))) else ((0 :: int) \<le> i \<and> i < int (length a)) \<and> (if max < a ! nat i then ((0 :: int) \<le> i \<and> i < int (length a)) \<and> is_min min a (0 :: int) (i + (1 :: int)) \<and> is_max (a ! nat i) a (0 :: int) (i + (1 :: int)) else is_min min a (0 :: int) (i + (1 :: int)) \<and> is_max max a (0 :: int) (i + (1 :: int))))) \<and> (is_min min a (0 :: int) (o3 + (1 :: int)) \<and> is_max max a (0 :: int) (o3 + (1 :: int)) \<longrightarrow> is_min min a (0 :: int) (int (length a)) \<and> is_max max a (0 :: int) (int (length a))))) \<and> (o3 + (1 :: int) < (1 :: int) \<longrightarrow> is_min o1 a (0 :: int) (int (length a)) \<and> is_max o2 a (0 :: int) (int (length a))))"
  sorry
end
