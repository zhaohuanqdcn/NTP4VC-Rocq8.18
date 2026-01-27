theory bellman_ford_BellmanFord_initialize_single_sourceqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref" "Why3STD.int_IntInf" "Why3STD.map_Const" "./bellman_ford_Graph"
begin
typedecl  set
consts to_fset :: "set \<Rightarrow> (vertex \<times> vertex) fset"
consts choose1 :: "set \<Rightarrow> vertex \<times> vertex"
axiomatization where choose'spec:   "choose1 s |\<in>| to_fset s"
 if "\<not>to_fset s = fempty"
  for s :: "set"
typedecl 'a t
consts contents :: "'a t \<Rightarrow> vertex \<Rightarrow> 'a"
consts create :: "'a \<Rightarrow> 'a t"
axiomatization where create'spec:   "contents (create x) = (const :: 'a \<Rightarrow> vertex \<Rightarrow> 'a) x"
  for x :: "'a"
consts mixfix_lbrb :: "'a t \<Rightarrow> vertex \<Rightarrow> 'a"
axiomatization where mixfix_lbrb'spec:   "mixfix_lbrb m k = contents m k"
  for m :: "'a t"
  and k :: "vertex"
consts mixfix_lblsmnrb :: "'a t \<Rightarrow> vertex \<Rightarrow> 'a \<Rightarrow> 'a t"
axiomatization where mixfix_lblsmnrb'spec:   "contents (mixfix_lblsmnrb m k v) = (contents m)(k := v)"
  for m :: "'a t"
  and k :: "vertex"
  and v :: "'a"
typedecl  distmap
theorem initialize_single_source'vc:
  fixes s :: "vertex"
  shows "let o1 :: int_IntInf.t = Infinite; m :: int_IntInf.t t = create o1 in contents m = (const :: int_IntInf.t \<Rightarrow> vertex \<Rightarrow> int_IntInf.t) o1 \<longrightarrow> mixfix_lblsmnrb m s (Finite (0 :: int)) = mixfix_lblsmnrb (create Infinite) s (Finite (0 :: int))"
  sorry
end
