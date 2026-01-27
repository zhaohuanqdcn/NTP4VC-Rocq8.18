import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.klibc_string.lib.lean.Axiomatic.Axiomatic
import frama_c.klibc_string.lib.lean.Compound.Compound
import frama_c.klibc_string.lib.lean.A_Length.A_Length
open Classical
open Lean4Why3
namespace strcmp_Why3_ide_VCstrcmp_disjoint_not_eq_not_eq_i_j_eq_part2_goal2
theorem goal2 (a : Memory.addr) (a_1 : Memory.addr) (t : ℤ -> ℤ) (t_1 : Memory.addr -> ℤ) (i : ℤ) (i_3 : ℤ) (i_1 : ℤ) (i_2 : ℤ) (fact0 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact1 : Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ)) (fact2 : Memory.linked t) (fact3 : Memory.sconst t_1) (fact4 : Axiomatic.p_length_of_str_is t t_1 a i) (fact5 : Axiomatic.p_length_of_str_is t t_1 a i_3) (fact6 : Axiomatic.p_length_of_str_is t t_1 a_1 i_1) (fact7 : Axiomatic.p_length_of_str_is t t_1 a_1 i_2) (fact8 : Memory.separated (Memory.shift a_1 (0 : ℤ)) ((1 : ℤ) + A_Length.l_length t_1 a_1) (Memory.shift a (0 : ℤ)) ((1 : ℤ) + A_Length.l_length t_1 a)) : (∀(i_5 : ℤ) (i_4 : ℤ), i_5 = i_4 ∨ ¬Axiomatic.p_length_of_str_is t t_1 a i_4 ∨ ¬Axiomatic.p_length_of_str_is t t_1 a_1 i_5) ∨ (∀(i_4 : ℤ), ¬Axiomatic.p_length_of_str_is t t_1 a i_4 ∨ ¬Axiomatic.p_length_of_str_is t t_1 a_1 i_4 ∨ (∀(i_5 : ℤ), t_1 (Memory.shift a_1 i_5) = t_1 (Memory.shift a i_5) ∨ i_5 < (0 : ℤ) ∨ i_4 < i_5))
  := sorry
end strcmp_Why3_ide_VCstrcmp_disjoint_not_eq_not_eq_i_j_eq_part2_goal2
