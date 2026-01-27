import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.verker.lib.lean.A_Strlen.A_Strlen
import frama_c.verker.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace strlcpy_Why3_ide_VCstrlcpy_size_is_greater_src_post_2_goal10
theorem goal10 (a_1 : Memory.addr) (a : Memory.addr) (t_1 : Memory.addr -> ℤ) (t : ℤ -> ℤ) : let x : ℤ := Memory.addr.base a_1; let x_1 : ℤ := Memory.addr.base a; let x_2 : ℤ := A_Strlen.l_strlen t_1 a; ¬x = x_1 → t_1 (Memory.shift a x_2) = (0 : ℤ) → x_2 < (0 : ℤ) → Memory.region x_1 ≤ (0 : ℤ) → Memory.region x ≤ (0 : ℤ) → Memory.linked t → Memory.sconst t_1 → A_Strlen.p_valid_str t t_1 a → Cint.is_uint64 x_2 → Memory.valid_rw t (Memory.shift a_1 (0 : ℤ)) (0 : ℤ) → (∀(i : ℤ), (0 : ℤ) ≤ i → i < x_2 → ¬t_1 (Memory.shift a i) = (0 : ℤ)) → A_Strlen.p_valid_str t t_1 a_1
  := sorry
end strlcpy_Why3_ide_VCstrlcpy_size_is_greater_src_post_2_goal10
