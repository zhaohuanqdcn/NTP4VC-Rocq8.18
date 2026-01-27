import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.verker.lib.lean.A_Strlen.A_Strlen
import frama_c.verker.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace strlcpy_Why3_ide_VCstrlcpy_call_memcpy_pre_goal5
theorem goal5 (a_1 : Memory.addr) (a : Memory.addr) (t_1 : Memory.addr -> ℤ) (i : ℤ) (t : ℤ -> ℤ) : let x : ℤ := Memory.addr.base a_1; let x_1 : ℤ := Memory.addr.base a; let x_2 : ℤ := A_Strlen.l_strlen t_1 a; ¬i = (0 : ℤ) → ¬x = x_1 → t_1 (Memory.shift a x_2) = (0 : ℤ) → Memory.region x_1 ≤ (0 : ℤ) → Memory.region x ≤ (0 : ℤ) → Memory.linked t → Memory.sconst t_1 → Cint.is_uint64 i → A_Strlen.p_valid_str t t_1 a → Cint.is_uint64 x_2 → Memory.valid_rw t (Memory.shift a_1 (0 : ℤ)) i → ¬(∀(i_1 : ℤ), (0 : ℤ) ≤ i_1 → i_1 < x_2 → ¬t_1 (Memory.shift a i_1) = (0 : ℤ))
  := sorry
end strlcpy_Why3_ide_VCstrlcpy_call_memcpy_pre_goal5
