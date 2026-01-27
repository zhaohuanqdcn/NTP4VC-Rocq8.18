theory inner_product_Why3_ide_VCinner_product_loop_inv_inner_established_goal5
  imports "NTP4Verif.NTP4Verif" "Why3STD.Qed_Qed" "Why3STD.Memory_Memory" "Why3STD.Cint_Cint" "../../lib/isabelle/Axiomatic1_Axiomatic1" "../../lib/isabelle/A_InnerProductAxiomatic_A_InnerProductAxiomatic" "../../lib/isabelle/Compound_Compound" "../../lib/isabelle/Axiomatic_Axiomatic"
begin
theorem goal5:
  fixes a :: "addr"
  fixes a_1 :: "addr"
  fixes t :: "int \<Rightarrow> int"
  fixes i :: "int"
  fixes i_1 :: "int"
  fixes t_1 :: "addr \<Rightarrow> int"
  assumes fact0: "region (base a) \<le> (0 :: int)"
  assumes fact1: "region (base a_1) \<le> (0 :: int)"
  assumes fact2: "linked t"
  assumes fact3: "is_uint32 i"
  assumes fact4: "is_sint32 i_1"
  assumes fact5: "p_productbounds t_1 a_1 a i"
  assumes fact6: "p_innerproductbounds t_1 a_1 a i i_1"
  assumes fact7: "valid_rd t (shift a (0 :: int)) i"
  assumes fact8: "valid_rd t (shift a_1 (0 :: int)) i"
  shows "l_innerproduct t_1 a_1 a (0 :: int) i_1 = i_1"
  sorry
end
