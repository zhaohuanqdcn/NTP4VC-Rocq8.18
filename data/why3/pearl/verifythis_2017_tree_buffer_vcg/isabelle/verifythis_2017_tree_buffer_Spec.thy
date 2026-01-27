theory verifythis_2017_tree_buffer_Spec
  imports "NTP4Verif.NTP4Verif"
begin
datatype 'a buf = buf'mk (h: "int") (xs: "'a list")
fun take :: "int \<Rightarrow> 'a list \<Rightarrow> 'a list"
  where "take n (Nil :: 'a list) = (Nil :: 'a list)" for n
      | "take n (Cons x xs1) = (if n = (0 :: int) then (Nil :: 'a list) else Cons x (take (n - (1 :: int)) xs1))" for n x xs1
definition add :: "'a \<Rightarrow> 'a buf \<Rightarrow> 'a buf"
  where "add x b = buf'mk (h b) (Cons x (xs b))" for x b
definition get :: "'a buf \<Rightarrow> 'a list"
  where "get b = take (h b) (xs b)" for b
end
