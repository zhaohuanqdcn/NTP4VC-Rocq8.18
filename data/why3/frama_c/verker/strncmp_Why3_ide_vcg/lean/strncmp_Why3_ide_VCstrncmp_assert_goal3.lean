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
namespace strncmp_Why3_ide_VCstrncmp_assert_goal3
theorem goal3 (t_1 : Memory.addr -> ℤ) (a_1 : Memory.addr) (i : ℤ) (a : Memory.addr) (i_1 : ℤ) (t : ℤ -> ℤ) : let x : ℤ := t_1 (Memory.shift a_1 i); let x_1 : ℤ := t_1 (Memory.shift a i); (0 : ℤ) ≤ i → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → i < A_Strnlen.l_strnlen t_1 a_1 i_1 → Memory.linked t → Memory.sconst t_1 → Cint.is_uint64 i_1 → A_Strnlen.p_valid_strn t t_1 a i_1 → A_Strnlen.p_valid_strn t t_1 a_1 i_1 → (Cint.to_uint8 x = Cint.to_uint8 x_1) = (x = x_1)
  := sorry
end strncmp_Why3_ide_VCstrncmp_assert_goal3
