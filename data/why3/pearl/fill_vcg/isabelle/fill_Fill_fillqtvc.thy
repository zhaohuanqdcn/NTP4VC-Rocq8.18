theory fill_Fill_fillqtvc
  imports "NTP4Verif.NTP4Verif"
begin
typedecl  elt
datatype  tree = Null | Node "tree" "elt" "tree"
fun contains :: "tree \<Rightarrow> elt \<Rightarrow> _"
  where "contains Null x = False" for x
      | "contains (Node l y r) x = (contains l x \<or> x = y \<or> contains r x)" for l y r x
theorem fill'vc:
  fixes start :: "int"
  fixes a :: "elt list"
  fixes t :: "tree"
  assumes fact0: "(0 :: int) \<le> start"
  assumes fact1: "start \<le> int (length a)"
  shows "case t of Null \<Rightarrow> (start \<le> start \<and> start \<le> int (length a)) \<and> (\<forall>(i :: int). start \<le> i \<and> i < start \<longrightarrow> contains t (a ! nat i)) | Node l x r \<Rightarrow> ((case t of Null \<Rightarrow> False | Node f _ f1 \<Rightarrow> f = l \<or> f1 = l) \<and> (0 :: int) \<le> start \<and> start \<le> int (length a)) \<and> (\<forall>(a1 :: elt list). length a1 = length a \<longrightarrow> (\<forall>(res :: int). (start \<le> res \<and> res \<le> int (length a1)) \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < start \<longrightarrow> a1 ! nat i = a ! nat i) \<and> (\<forall>(i :: int). start \<le> i \<and> i < res \<longrightarrow> contains l (a1 ! nat i)) \<longrightarrow> (if \<not>res = int (length a1) then ((0 :: int) \<le> res \<and> res < int (length a1)) \<and> (length (a1[nat res := x]) = length a1 \<longrightarrow> nth (a1[nat res := x]) o nat = (nth a1 o nat)(res := x) \<longrightarrow> (let o1 :: int = res + (1 :: int) in ((case t of Null \<Rightarrow> False | Node f _ f1 \<Rightarrow> f = r \<or> f1 = r) \<and> (0 :: int) \<le> o1 \<and> o1 \<le> int (length (a1[nat res := x]))) \<and> (\<forall>(a2 :: elt list). length a2 = length (a1[nat res := x]) \<longrightarrow> (\<forall>(result :: int). (o1 \<le> result \<and> result \<le> int (length a2)) \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < o1 \<longrightarrow> a2 ! nat i = a1[nat res := x] ! nat i) \<and> (\<forall>(i :: int). o1 \<le> i \<and> i < result \<longrightarrow> contains r (a2 ! nat i)) \<longrightarrow> (start \<le> result \<and> result \<le> int (length a2)) \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < start \<longrightarrow> a2 ! nat i = a ! nat i) \<and> (\<forall>(i :: int). start \<le> i \<and> i < result \<longrightarrow> contains t (a2 ! nat i)))))) else (start \<le> res \<and> res \<le> int (length a1)) \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < start \<longrightarrow> a1 ! nat i = a ! nat i) \<and> (\<forall>(i :: int). start \<le> i \<and> i < res \<longrightarrow> contains t (a1 ! nat i)))))"
  sorry
end
