theory array_IntArraySorted
  imports "NTP4Verif.NTP4Verif"
begin
definition sorted_sub :: "(int \<Rightarrow> int) \<Rightarrow> int \<Rightarrow> int \<Rightarrow> _"
  where "sorted_sub a l u \<longleftrightarrow> (\<forall>(i1 :: int) (i2 :: int). l \<le> i1 \<and> i1 \<le> i2 \<and> i2 < u \<longrightarrow> a i1 \<le> a i2)" for a l u
definition sorted_sub1 :: "int list \<Rightarrow> int \<Rightarrow> int \<Rightarrow> _"
  where "sorted_sub1 a l u \<longleftrightarrow> sorted_sub (nth a o nat) l u" for a l u
definition sorted :: "int list \<Rightarrow> _"
  where "sorted a \<longleftrightarrow> sorted_sub (nth a o nat) (0 :: int) (int (length a))" for a
end
