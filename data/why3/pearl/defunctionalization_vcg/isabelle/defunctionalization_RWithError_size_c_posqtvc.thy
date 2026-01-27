theory defunctionalization_RWithError_size_c_posqtvc
  imports "NTP4Verif.NTP4Verif" "./defunctionalization_Expr" "./defunctionalization_DirectSem" "./defunctionalization_Defunctionalization" "./defunctionalization_SemWithError"
begin
datatype  "context" = Empty | Left "context" "expr" | Right "int" "context"
fun size_c :: "context \<Rightarrow> int"
  where "size_c (Empty :: context) = (0 :: int)"
      | "size_c (Left c1 e) = (2 :: int) + size_c c1 + defunctionalization_Defunctionalization.size_e e" for c1 e
      | "size_c (Right x c1) = (1 :: int) + size_c c1" for x c1
theorem size_c_pos'vc:
  fixes c :: "context"
  shows "(0 :: int) \<le> size_c c"
  sorry
end
