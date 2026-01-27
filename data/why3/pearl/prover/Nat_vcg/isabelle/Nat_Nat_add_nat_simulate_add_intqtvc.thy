theory Nat_Nat_add_nat_simulate_add_intqtvc
  imports "NTP4Verif.NTP4Verif"
begin
datatype  nat = ONat | SNat "nat"
fun nat_to_int :: "nat \<Rightarrow> int"
  where "nat_to_int ONat = (0 :: int)"
      | "nat_to_int (SNat n1) = (1 :: int) + nat_to_int n1" for n1
fun add_nat :: "nat \<Rightarrow> nat \<Rightarrow> nat"
  where "add_nat ONat n2 = n2" for n2
      | "add_nat (SNat n11) n2 = SNat (add_nat n11 n2)" for n11 n2
theorem add_nat_simulate_add_int'vc:
  fixes n1 :: "nat"
  fixes n2 :: "nat"
  shows "nat_to_int (add_nat n1 n2) = nat_to_int n1 + nat_to_int n2"
  sorry
end
