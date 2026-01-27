import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.verker.lib.lean.A_Strnlen.A_Strnlen
import frama_c.verker.lib.lean.Compound.Compound
import frama_c.verker.lib.lean.A_Strlen.A_Strlen
open Classical
open Lean4Why3
namespace strncmp_Why3_ide_VCstrncmp_loop_inv_3_established_goal9
theorem goal9 (a : Memory.addr) (a_1 : Memory.addr) (t : ℤ -> ℤ) (t_1 : Memory.addr -> ℤ) (i : ℤ) (fact0 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact1 : Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ)) (fact2 : Memory.linked t) (fact3 : Memory.sconst t_1) (fact4 : Cint.is_uint64 i) (fact5 : A_Strnlen.p_valid_strn t t_1 a i) (fact6 : A_Strnlen.p_valid_strn t t_1 a_1 i) (fact7 : ∀(i_1 : ℤ), let x : ℤ := t_1 (Memory.shift a_1 i_1); let x_1 : ℤ := t_1 (Memory.shift a i_1); (0 : ℤ) ≤ i_1 → i_1 < A_Strnlen.l_strnlen t_1 a_1 i → (Cint.to_uint8 x = Cint.to_uint8 x_1) = (x = x_1)) : Memory.addr_le a a ∧ Memory.addr_le a (Memory.shift a (A_Strnlen.l_strnlen t_1 a i))
  := sorry
end strncmp_Why3_ide_VCstrncmp_loop_inv_3_established_goal9
