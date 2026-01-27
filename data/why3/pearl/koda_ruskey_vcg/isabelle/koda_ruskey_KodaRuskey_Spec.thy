theory koda_ruskey_KodaRuskey_Spec
  imports "NTP4Verif.NTP4Verif"
begin
datatype  color = White | Black
datatype  forest = E | N "int" "forest" "forest"
typedecl  coloring
fun size_forest :: "forest \<Rightarrow> int"
  where "size_forest (E :: forest) = (0 :: int)"
      | "size_forest (N x f1 f2) = (1 :: int) + size_forest f1 + size_forest f2" for x f1 f2
fun mem_forest :: "int \<Rightarrow> forest \<Rightarrow> _"
  where "mem_forest n (E :: forest) = False" for n
      | "mem_forest n (N i f1 f2) = (i = n \<or> mem_forest n f1 \<or> mem_forest n f2)" for n i f1 f2
definition between_range_forest :: "int \<Rightarrow> int \<Rightarrow> forest \<Rightarrow> _"
  where "between_range_forest i j f \<longleftrightarrow> (\<forall>(n :: int). mem_forest n f \<longrightarrow> i \<le> n \<and> n < j)" for i j f
definition disjoint :: "forest \<Rightarrow> forest \<Rightarrow> _"
  where "disjoint f1 f2 \<longleftrightarrow> (\<forall>(x :: int). mem_forest x f1 \<longrightarrow> \<not>mem_forest x f2)" for f1 f2
fun no_repeated_forest :: "forest \<Rightarrow> _"
  where "no_repeated_forest (E :: forest) = True"
      | "no_repeated_forest (N i f1 f2) = (no_repeated_forest f1 \<and> no_repeated_forest f2 \<and> \<not>mem_forest i f1 \<and> \<not>mem_forest i f2 \<and> disjoint f1 f2)" for i f1 f2
definition valid_nums_forest :: "forest \<Rightarrow> int \<Rightarrow> _"
  where "valid_nums_forest f n \<longleftrightarrow> between_range_forest (0 :: int) n f \<and> no_repeated_forest f" for f n
fun white_forest :: "forest \<Rightarrow> (int \<Rightarrow> color) \<Rightarrow> _"
  where "white_forest (E :: forest) c = True" for c
      | "white_forest (N i f1 f2) c = (c i = White \<and> white_forest f1 c \<and> white_forest f2 c)" for i f1 f2 c
fun valid_coloring :: "forest \<Rightarrow> (int \<Rightarrow> color) \<Rightarrow> _"
  where "valid_coloring (E :: forest) c = True" for c
      | "valid_coloring (N i f1 f2) c = (valid_coloring f2 c \<and> (case c i of White \<Rightarrow> white_forest f1 c | Black \<Rightarrow> valid_coloring f1 c))" for i f1 f2 c
fun count_forest :: "forest \<Rightarrow> int"
  where "count_forest (E :: forest) = (1 :: int)"
      | "count_forest (N x f1 f2) = ((1 :: int) + count_forest f1) * count_forest f2" for x f1 f2
definition eq_coloring :: "int \<Rightarrow> (int \<Rightarrow> color) \<Rightarrow> (int \<Rightarrow> color) \<Rightarrow> _"
  where "eq_coloring n c1 c2 \<longleftrightarrow> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < n \<longrightarrow> c1 i = c2 i)" for n c1 c2
end
