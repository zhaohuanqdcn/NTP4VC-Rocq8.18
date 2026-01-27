theory sumrange_CumulativeTree_queryqtvc
  imports "NTP4Verif.NTP4Verif" "./sumrange_ArraySum" "./sumrange_ExtraLemmas"
begin
datatype  indexes = indexes'mk (low: "int") (high: "int") (isum: "int")
datatype  tree = Leaf "indexes" | Node "indexes" "tree" "tree"
definition indexes1 :: "tree \<Rightarrow> indexes"
  where "indexes1 t = (case t of Leaf ind \<Rightarrow> ind | Node ind _ _ \<Rightarrow> ind)" for t
definition is_indexes_for :: "indexes \<Rightarrow> int list \<Rightarrow> int \<Rightarrow> int \<Rightarrow> _"
  where "is_indexes_for ind a i j \<longleftrightarrow> low ind = i \<and> high ind = j \<and> ((0 :: int) \<le> i \<and> i < j \<and> j \<le> int (length a)) \<and> isum ind = sum a i j" for ind a i j
fun is_tree_for :: "tree \<Rightarrow> int list \<Rightarrow> int \<Rightarrow> int \<Rightarrow> _"
  where "is_tree_for (Leaf ind) a i j = (is_indexes_for ind a i j \<and> j = i + (1 :: int))" for ind a i j
      | "is_tree_for (Node ind l r) a i j = (is_indexes_for ind a i j \<and> i = low (indexes1 l) \<and> j = high (indexes1 r) \<and> (let m :: int = high (indexes1 l) in m = low (indexes1 r) \<and> (i < m \<and> m < j) \<and> m = (i + j) cdiv (2 :: int) \<and> is_tree_for l a i m \<and> is_tree_for r a m j))" for ind l r a i j
theorem query'vc:
  fixes i :: "int"
  fixes j :: "int"
  fixes a :: "int list"
  fixes t :: "tree"
  assumes fact0: "(0 :: int) \<le> i"
  assumes fact1: "i \<le> j"
  assumes fact2: "j \<le> int (length a)"
  assumes fact3: "is_tree_for t a (0 :: int) (int (length a))"
  shows "\<not>i = j \<longrightarrow> is_tree_for t a (low (indexes1 t)) (high (indexes1 t)) \<and> (0 :: int) \<le> low (indexes1 t) \<and> low (indexes1 t) \<le> i \<and> i < j \<and> j \<le> high (indexes1 t) \<and> high (indexes1 t) \<le> int (length a)"
  and "\<forall>(result :: int). (if i = j then result = (0 :: int) else result = sum a i j) \<longrightarrow> result = sum a i j"
  sorry
end
