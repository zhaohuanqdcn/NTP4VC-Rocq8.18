import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import frama_c.verker.lib.lean.Compound.Compound
import Why3.Cint.Cint
import frama_c.verker.lib.lean.A_Strlen.A_Strlen
open Classical
open Lean4Why3
namespace strcmp_Why3_ide_VCstrcmp_assert_goal1
theorem goal1 (t_1 : Memory.addr -> ℤ) (a_1 : Memory.addr) (a : Memory.addr) (t : ℤ -> ℤ) : let x : ℤ := A_Strlen.l_strlen t_1 a_1; Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.linked t → Memory.sconst t_1 → A_Strlen.p_valid_str t t_1 a → A_Strlen.p_valid_str t t_1 a_1 → (∀(i : ℤ), (0 : ℤ) ≤ i → i ≤ x → Cint.to_uint8 (t_1 (Memory.shift a_1 i)) = Cint.to_uint8 (t_1 (Memory.shift a i))) = (∀(i : ℤ), (0 : ℤ) ≤ i → i ≤ x → t_1 (Memory.shift a_1 i) = t_1 (Memory.shift a i))
  := sorry
end strcmp_Why3_ide_VCstrcmp_assert_goal1
