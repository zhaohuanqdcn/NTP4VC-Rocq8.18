theory mergesort_array_Merge_mergeqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref" "Why3STD.map_MapEq" "Why3STD.map_MapExchange" "Why3STD.map_MapPermut"
begin
typedecl  elt
consts le :: "elt \<Rightarrow> elt \<Rightarrow> bool"
axiomatization where Refl:   "le x x"
  for x :: "elt"
axiomatization where Trans:   "le x z"
 if "le x y"
 and "le y z"
  for x :: "elt"
  and y :: "elt"
  and z :: "elt"
axiomatization where Total:   "le x y \<or> le y x"
  for x :: "elt"
  and y :: "elt"
definition sorted_sub :: "elt list \<Rightarrow> int \<Rightarrow> int \<Rightarrow> _"
  where "sorted_sub a l u \<longleftrightarrow> (\<forall>(i1 :: int) (i2 :: int). l \<le> i1 \<and> i1 < i2 \<and> i2 < u \<longrightarrow> le (a ! nat i1) (a ! nat i2))" for a l u
definition sorted :: "elt list \<Rightarrow> _"
  where "sorted a \<longleftrightarrow> (\<forall>(i1 :: int) (i2 :: int). (0 :: int) \<le> i1 \<and> i1 < i2 \<and> i2 < int (length a) \<longrightarrow> le (a ! nat i1) (a ! nat i2))" for a
theorem merge'vc:
  fixes l :: "int"
  fixes m :: "int"
  fixes r :: "int"
  fixes tmp :: "elt list"
  fixes a :: "elt list"
  assumes fact0: "(0 :: int) \<le> l"
  assumes fact1: "l \<le> m"
  assumes fact2: "m \<le> r"
  assumes fact3: "r \<le> int (length tmp)"
  assumes fact4: "length tmp = length a"
  assumes fact5: "sorted_sub tmp l m"
  assumes fact6: "sorted_sub tmp m r"
  shows "let o1 :: int = r - (1 :: int) in (l \<le> o1 + (1 :: int) \<longrightarrow> ((l \<le> l \<and> l \<le> m \<and> m \<le> m \<and> m \<le> r) \<and> l - l + m - m = l - l \<and> sorted_sub a l l \<and> (\<forall>(x :: int) (y :: int). l \<le> x \<and> x < l \<longrightarrow> l \<le> y \<and> y < m \<longrightarrow> le (a ! nat x) (tmp ! nat y)) \<and> (\<forall>(x :: int) (y :: int). l \<le> x \<and> x < l \<longrightarrow> m \<le> y \<and> y < r \<longrightarrow> le (a ! nat x) (tmp ! nat y)) \<and> (\<forall>(v :: elt). int (map_occ v (nth tmp o nat) l l) + int (map_occ v (nth tmp o nat) m m) = int (map_occ v (nth a o nat) l l))) \<and> (\<forall>(j :: int) (i :: int) (a1 :: elt list). length a1 = length a \<longrightarrow> (\<forall>(k :: int). (l \<le> k \<and> k \<le> o1) \<and> (l \<le> i \<and> i \<le> m \<and> m \<le> j \<and> j \<le> r) \<and> i - l + j - m = k - l \<and> sorted_sub a1 l k \<and> (\<forall>(x :: int) (y :: int). l \<le> x \<and> x < k \<longrightarrow> i \<le> y \<and> y < m \<longrightarrow> le (a1 ! nat x) (tmp ! nat y)) \<and> (\<forall>(x :: int) (y :: int). l \<le> x \<and> x < k \<longrightarrow> j \<le> y \<and> y < r \<longrightarrow> le (a1 ! nat x) (tmp ! nat y)) \<and> (\<forall>(v :: elt). int (map_occ v (nth tmp o nat) l i) + int (map_occ v (nth tmp o nat) m j) = int (map_occ v (nth a1 o nat) l k)) \<and> (\<forall>(i1 :: int). (0 :: int) \<le> i1 \<and> i1 < l \<or> r \<le> i1 \<and> i1 < int (length a1) \<longrightarrow> a1 ! nat i1 = a ! nat i1) \<longrightarrow> (i < m \<longrightarrow> \<not>j = r \<longrightarrow> ((0 :: int) \<le> j \<and> j < int (length tmp)) \<and> (0 :: int) \<le> i \<and> i < int (length tmp)) \<and> (\<forall>(o2 :: bool). (if i < m then if j = r then o2 = True else o2 = (if le (tmp ! nat i) (tmp ! nat j) then True else False) else o2 = False) \<longrightarrow> (if o2 = True then ((0 :: int) \<le> i \<and> i < int (length tmp)) \<and> (let o3 :: elt = tmp ! nat i in ((0 :: int) \<le> k \<and> k < int (length a1)) \<and> (length (a1[nat k := o3]) = length a1 \<longrightarrow> nth (a1[nat k := o3]) o nat = (nth a1 o nat)(k := o3) \<longrightarrow> (l \<le> i + (1 :: int) \<and> i + (1 :: int) \<le> m \<and> m \<le> j \<and> j \<le> r) \<and> i + (1 :: int) - l + j - m = k + (1 :: int) - l \<and> sorted_sub (a1[nat k := o3]) l (k + (1 :: int)) \<and> (\<forall>(x :: int) (y :: int). l \<le> x \<and> x < k + (1 :: int) \<longrightarrow> i + (1 :: int) \<le> y \<and> y < m \<longrightarrow> le (a1[nat k := o3] ! nat x) (tmp ! nat y)) \<and> (\<forall>(x :: int) (y :: int). l \<le> x \<and> x < k + (1 :: int) \<longrightarrow> j \<le> y \<and> y < r \<longrightarrow> le (a1[nat k := o3] ! nat x) (tmp ! nat y)) \<and> (\<forall>(v :: elt). int (map_occ v (nth tmp o nat) l (i + (1 :: int))) + int (map_occ v (nth tmp o nat) m j) = int (map_occ v (nth (a1[nat k := o3]) o nat) l (k + (1 :: int)))) \<and> (\<forall>(i1 :: int). (0 :: int) \<le> i1 \<and> i1 < l \<or> r \<le> i1 \<and> i1 < int (length (a1[nat k := o3])) \<longrightarrow> a1[nat k := o3] ! nat i1 = a ! nat i1))) else ((0 :: int) \<le> j \<and> j < int (length tmp)) \<and> (let o3 :: elt = tmp ! nat j in ((0 :: int) \<le> k \<and> k < int (length a1)) \<and> (length (a1[nat k := o3]) = length a1 \<longrightarrow> nth (a1[nat k := o3]) o nat = (nth a1 o nat)(k := o3) \<longrightarrow> (l \<le> i \<and> i \<le> m \<and> m \<le> j + (1 :: int) \<and> j + (1 :: int) \<le> r) \<and> i - l + (j + (1 :: int)) - m = k + (1 :: int) - l \<and> sorted_sub (a1[nat k := o3]) l (k + (1 :: int)) \<and> (\<forall>(x :: int) (y :: int). l \<le> x \<and> x < k + (1 :: int) \<longrightarrow> i \<le> y \<and> y < m \<longrightarrow> le (a1[nat k := o3] ! nat x) (tmp ! nat y)) \<and> (\<forall>(x :: int) (y :: int). l \<le> x \<and> x < k + (1 :: int) \<longrightarrow> j + (1 :: int) \<le> y \<and> y < r \<longrightarrow> le (a1[nat k := o3] ! nat x) (tmp ! nat y)) \<and> (\<forall>(v :: elt). int (map_occ v (nth tmp o nat) l i) + int (map_occ v (nth tmp o nat) m (j + (1 :: int))) = int (map_occ v (nth (a1[nat k := o3]) o nat) l (k + (1 :: int)))) \<and> (\<forall>(i1 :: int). (0 :: int) \<le> i1 \<and> i1 < l \<or> r \<le> i1 \<and> i1 < int (length (a1[nat k := o3])) \<longrightarrow> a1[nat k := o3] ! nat i1 = a ! nat i1)))))) \<and> ((l \<le> i \<and> i \<le> m \<and> m \<le> j \<and> j \<le> r) \<and> i - l + j - m = o1 + (1 :: int) - l \<and> sorted_sub a1 l (o1 + (1 :: int)) \<and> (\<forall>(x :: int) (y :: int). l \<le> x \<and> x < o1 + (1 :: int) \<longrightarrow> i \<le> y \<and> y < m \<longrightarrow> le (a1 ! nat x) (tmp ! nat y)) \<and> (\<forall>(x :: int) (y :: int). l \<le> x \<and> x < o1 + (1 :: int) \<longrightarrow> j \<le> y \<and> y < r \<longrightarrow> le (a1 ! nat x) (tmp ! nat y)) \<and> (\<forall>(v :: elt). int (map_occ v (nth tmp o nat) l i) + int (map_occ v (nth tmp o nat) m j) = int (map_occ v (nth a1 o nat) l (o1 + (1 :: int)))) \<and> (\<forall>(i1 :: int). (0 :: int) \<le> i1 \<and> i1 < l \<or> r \<le> i1 \<and> i1 < int (length a1) \<longrightarrow> a1 ! nat i1 = a ! nat i1) \<longrightarrow> sorted_sub a1 l r \<and> permut_sub tmp a1 (nat l) (nat r) \<and> (\<forall>(i1 :: int). (0 :: int) \<le> i1 \<and> i1 < l \<or> r \<le> i1 \<and> i1 < int (length a1) \<longrightarrow> a1 ! nat i1 = a ! nat i1)))) \<and> (o1 + (1 :: int) < l \<longrightarrow> sorted_sub a l r \<and> permut_sub tmp a (nat l) (nat r))"
  sorry
end
