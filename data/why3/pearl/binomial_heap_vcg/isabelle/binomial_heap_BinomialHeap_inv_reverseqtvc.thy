theory binomial_heap_BinomialHeap_inv_reverseqtvc
  imports "NTP4Verif.NTP4Verif"
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
datatype  tree = tree'mk (elem: "elt") (children: "tree list") (rank: "int")
fun size :: "tree list \<Rightarrow> int"
  where "size (Nil :: tree list) = (0 :: int)"
      | "size (Cons (tree'mk x c x0) r) = (1 :: int) + size c + size r" for x c x0 r
fun le_roots :: "elt \<Rightarrow> tree list \<Rightarrow> _"
  where "le_roots e (Nil :: tree list) = True" for e
      | "le_roots e (Cons t r) = (le e (elem t) \<and> le_roots e r)" for e t r
fun heaps :: "tree list \<Rightarrow> _"
  where "heaps (Nil :: tree list) = True"
      | "heaps (Cons (tree'mk e c x) r) = (le_roots e c \<and> heaps c \<and> heaps r)" for e c x r
fun occ :: "elt \<Rightarrow> tree list \<Rightarrow> int"
  where "occ x (Nil :: tree list) = (0 :: int)" for x
      | "occ x (Cons (tree'mk y c x0) r) = (if x = y then 1 :: int else (0 :: int)) + occ x c + occ x r" for x y c x0 r
definition mem :: "elt \<Rightarrow> tree list \<Rightarrow> _"
  where "mem x l \<longleftrightarrow> (0 :: int) < occ x l" for x l
fun has_order :: "int \<Rightarrow> tree list \<Rightarrow> _"
  where "has_order k (Nil :: tree list) = (k = (0 :: int))" for k
      | "has_order k (Cons (tree'mk x c k') r) = (k' = k - (1 :: int) \<and> has_order (k - (1 :: int)) c \<and> has_order (k - (1 :: int)) r)" for k x c k' r
definition binomial_tree :: "tree \<Rightarrow> _"
  where "binomial_tree t \<longleftrightarrow> rank t = int (length (children t)) \<and> has_order (rank t) (children t)" for t
typedecl  heap
fun inv :: "int \<Rightarrow> tree list \<Rightarrow> _"
  where "inv m (Nil :: tree list) = True" for m
      | "inv m (Cons t r) = (let k :: int = rank t in m \<le> k \<and> binomial_tree t \<and> inv (k + (1 :: int)) r)" for m t r
theorem inv_reverse'vc:
  fixes t :: "tree"
  assumes fact0: "binomial_tree t"
  shows "inv (0 :: int) (rev (children t))"
  sorry
end
