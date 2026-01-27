theory add_list_SumList
  imports "NTP4Verif.NTP4Verif"
begin
datatype  or_integer_float = Integer "int" | Real "real"
fun add_int :: "or_integer_float list \<Rightarrow> int"
  where "add_int (Nil :: or_integer_float list) = (0 :: int)"
      | "add_int (Cons (Integer n) t) = n + add_int t" for n t
      | "add_int (Cons x t) = add_int t" for x t
fun add_real :: "or_integer_float list \<Rightarrow> real"
  where "add_real (Nil :: or_integer_float list) = (0 :: Real.real)"
      | "add_real (Cons (Real x) t) = x + add_real t" for x t
      | "add_real (Cons x t) = add_real t" for x t
end
