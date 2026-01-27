import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.klibc_string.lib.lean.Axiomatic.Axiomatic
import frama_c.klibc_string.lib.lean.Compound.Compound
import frama_c.klibc_string.lib.lean.A_Length.A_Length
open Classical
open Lean4Why3
namespace __strxspn_Why3_ide_VC__strxspn_disjoint_one_zero_goal0
theorem goal0 (a : Memory.addr) (a_1 : Memory.addr) (t : ℤ -> ℤ) (t_1 : Memory.addr -> ℤ) (i_1 : ℤ) (i_3 : ℤ) (i_2 : ℤ) (i_4 : ℤ) (fact0 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact1 : Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ)) (fact2 : Memory.linked t) (fact3 : Memory.sconst t_1) (fact4 : Cint.is_sint32 (0 : ℤ)) (fact5 : Cint.is_sint8 (t_1 a_1)) (fact6 : Axiomatic.p_length_of_str_is t t_1 a i_1) (fact7 : Axiomatic.p_length_of_str_is t t_1 a i_3) (fact8 : Axiomatic.p_length_of_str_is t t_1 a_1 i_2) (fact9 : Axiomatic.p_length_of_str_is t t_1 a_1 i_4) (fact10 : Memory.separated (Memory.shift a (0 : ℤ)) ((1 : ℤ) + A_Length.l_length t_1 a) (Memory.shift a_1 (0 : ℤ)) ((1 : ℤ) + A_Length.l_length t_1 a_1)) (fact11 : True ∨ (0 : ℤ) = (1 : ℤ)) : ¬True ∨ ¬(0 : ℤ) = (1 : ℤ)
  := sorry
end __strxspn_Why3_ide_VC__strxspn_disjoint_one_zero_goal0
