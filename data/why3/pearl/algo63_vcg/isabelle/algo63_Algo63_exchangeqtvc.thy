theory algo63_Algo63_exchangeqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref" "Why3STD.map_MapEq" "Why3STD.map_MapExchange" "Why3STD.map_MapPermut"
begin
theorem exchange'vc:
  fixes m :: "int"
  fixes i :: "int"
  fixes n :: "int"
  fixes a :: "int list"
  fixes j :: "int"
  assumes fact0: "(0 :: int) \<le> m"
  assumes fact1: "m \<le> i"
  assumes fact2: "i \<le> n"
  assumes fact3: "n < int (length a)"
  assumes fact4: "m \<le> j"
  assumes fact5: "j \<le> n"
  shows "(0 :: int) \<le> i"
  and "i < int (length a)"
  and "let v :: int = a ! nat i in ((0 :: int) \<le> j \<and> j < int (length a)) \<and> (let o1 :: int = a ! nat j in ((0 :: int) \<le> i \<and> i < int (length a)) \<and> (length (a[nat i := o1]) = length a \<longrightarrow> nth (a[nat i := o1]) o nat = (nth a o nat)(i := o1) \<longrightarrow> ((0 :: int) \<le> j \<and> j < int (length (a[nat i := o1]))) \<and> (length (a[nat j := v, nat i := o1]) = length (a[nat i := o1]) \<longrightarrow> nth (a[nat j := v, nat i := o1]) o nat = (nth (a[nat i := o1]) o nat)(j := v) \<longrightarrow> list_exchange a (a[nat j := v, nat i := o1]) i j \<and> permut_sub' a (a[nat j := v, nat i := o1]) (nat m) (nat (n + (1 :: int))))))"
  sorry
end
