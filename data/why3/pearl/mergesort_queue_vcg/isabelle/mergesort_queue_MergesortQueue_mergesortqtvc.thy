theory mergesort_queue_MergesortQueue_mergesortqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.int_NumOf" "Why3STD.queue_Queue"
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
  where "sorted_sub s l u \<longleftrightarrow> (\<forall>(i1 :: int) (i2 :: int). l \<le> i1 \<and> i1 \<le> i2 \<and> i2 < u \<longrightarrow> le (s ! nat i1) (s ! nat i2))" for s l u
definition sorted :: "elt list \<Rightarrow> _"
  where "sorted s \<longleftrightarrow> sorted_sub s (0 :: int) (int (length s))" for s
axiomatization where sorted_cons:   "(\<forall>(i :: int). (0 :: int) \<le> i \<and> i < int (length s) \<longrightarrow> le x (s ! nat i)) \<and> sorted s \<longleftrightarrow> sorted (Cons x s)"
  for s :: "elt list"
  and x :: "elt"
axiomatization where sorted_append:   "sorted s1 \<and> sorted s2 \<and> (\<forall>(i :: int) (j :: int). ((0 :: int) \<le> i \<and> i < int (length s1)) \<and> (0 :: int) \<le> j \<and> j < int (length s2) \<longrightarrow> le (s1 ! nat i) (s2 ! nat j)) \<longleftrightarrow> sorted (s1 @ s2)"
  for s1 :: "elt list"
  and s2 :: "elt list"
axiomatization where sorted_snoc:   "(\<forall>(i :: int). (0 :: int) \<le> i \<and> i < int (length s) \<longrightarrow> le (s ! nat i) x) \<and> sorted s \<longleftrightarrow> sorted (s @ [x])"
  for s :: "elt list"
  and x :: "elt"
theorem mergesort'vc:
  fixes o1 :: "nat"
  fixes q :: "elt t"
  assumes fact0: "o1 = length (seq q)"
  shows "if (1 :: nat) < o1 then \<forall>(q1 :: elt t). seq q1 = [] \<longrightarrow> (\<forall>(q2 :: elt t). seq q2 = [] \<longrightarrow> ((\<forall>(x :: elt). int (count_list (seq q1) x) + int (count_list (seq q2) x) + int (count_list (seq q) x) = int (count_list (seq q) x)) \<and> int (length (seq q)) = int (length (seq q1)) + int (length (seq q2)) + int (length (seq q)) \<and> (length (seq q1) = length (seq q2) \<or> int (length (seq q)) = (0 :: int) \<and> int (length (seq q1)) = int (length (seq q2)) + (1 :: int))) \<and> (\<forall>(q21 :: elt t) (q11 :: elt t) (q3 :: elt t). (\<forall>(x :: elt). int (count_list (seq q11) x) + int (count_list (seq q21) x) + int (count_list (seq q3) x) = int (count_list (seq q) x)) \<and> int (length (seq q)) = int (length (seq q11)) + int (length (seq q21)) + int (length (seq q3)) \<and> (length (seq q11) = length (seq q21) \<or> int (length (seq q3)) = (0 :: int) \<and> int (length (seq q11)) = int (length (seq q21)) + (1 :: int)) \<longrightarrow> (if \<not>seq q3 = [] then \<not>seq q3 = [] \<and> (\<forall>(q4 :: elt t). seq q4 = drop (1 :: nat) (seq q3) \<longrightarrow> (\<forall>(q12 :: elt t). seq q12 = seq q11 @ [seq q3 ! (0 :: nat)] \<longrightarrow> (if \<not>seq q4 = [] then \<not>seq q4 = [] \<and> (\<forall>(q5 :: elt t). seq q5 = drop (1 :: nat) (seq q4) \<longrightarrow> (\<forall>(q22 :: elt t). seq q22 = seq q21 @ [seq q4 ! (0 :: nat)] \<longrightarrow> ((0 :: int) \<le> int (length (seq q3)) \<and> length (seq q5) < length (seq q3)) \<and> (\<forall>(x :: elt). int (count_list (seq q12) x) + int (count_list (seq q22) x) + int (count_list (seq q5) x) = int (count_list (seq q) x)) \<and> int (length (seq q)) = int (length (seq q12)) + int (length (seq q22)) + int (length (seq q5)) \<and> (length (seq q12) = length (seq q22) \<or> int (length (seq q5)) = (0 :: int) \<and> int (length (seq q12)) = int (length (seq q22)) + (1 :: int)))) else ((0 :: int) \<le> int (length (seq q3)) \<and> length (seq q4) < length (seq q3)) \<and> (\<forall>(x :: elt). int (count_list (seq q12) x) + int (count_list (seq q21) x) + int (count_list (seq q4) x) = int (count_list (seq q) x)) \<and> int (length (seq q)) = int (length (seq q12)) + int (length (seq q21)) + int (length (seq q4)) \<and> (length (seq q12) = length (seq q21) \<or> int (length (seq q4)) = (0 :: int) \<and> int (length (seq q12)) = int (length (seq q21)) + (1 :: int))))) else ((0 :: int) \<le> int (length (seq q)) \<and> length (seq q11) < length (seq q)) \<and> (\<forall>(q12 :: elt t). sorted (seq q12) \<and> seq q12 <~~> seq q11 \<longrightarrow> ((0 :: int) \<le> int (length (seq q)) \<and> length (seq q21) < length (seq q)) \<and> (\<forall>(q22 :: elt t). sorted (seq q22) \<and> seq q22 <~~> seq q21 \<longrightarrow> (seq q3 = [] \<and> sorted (seq q12) \<and> sorted (seq q22)) \<and> (\<forall>(q4 :: elt t). sorted (seq q4) \<and> int (length (seq q4)) = int (length (seq q12)) + int (length (seq q22)) \<and> (\<forall>(x :: elt). int (count_list (seq q4) x) = int (count_list (seq q12) x) + int (count_list (seq q22) x)) \<longrightarrow> sorted (seq q4) \<and> seq q4 <~~> seq q)))))) else sorted (seq q) \<and> seq q <~~> seq q"
  sorry
end
