import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import frama_c.verker.lib.lean.Compound.Compound
import frama_c.verker.lib.lean.A_Strlen.A_Strlen
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace stpcpy_Why3_ide_VCstpcpy_assert_3_goal11
theorem goal11 (a_2 : Memory.addr) (a_1 : Memory.addr) (t_2 : Memory.addr -> ℤ) (a_3 : Memory.addr) (a : Memory.addr) (t_1 : Memory.addr -> ℤ) (t_3 : Memory.addr -> ℤ) (t : ℤ -> ℤ) : let x : ℤ := Memory.addr.base a_2; let x_1 : ℤ := Memory.addr.base a_1; let m : Memory.addr -> ℤ := Function.update t_2 a_3 (0 : ℤ); let x_2 : ℤ := Memory.addr.offset a_1; let x_3 : ℤ := Memory.addr.offset a; let x_4 : ℤ := A_Strlen.l_strlen t_2 a_1; let a_4 : Memory.addr := Memory.shift a_2 (0 : ℤ); t_2 a = (0 : ℤ) → ¬x = x_1 → m (Memory.shift a (0 : ℤ)) = (0 : ℤ) → x_2 + Memory.addr.offset a_3 = x_3 + Memory.addr.offset a_2 → x_2 + x_4 = x_3 + A_Strlen.l_strlen t_2 a → Memory.havoc t_1 t_3 a_4 ((1 : ℤ) + x_4) = t_2 → Memory.region x_1 ≤ (0 : ℤ) → Memory.region x ≤ (0 : ℤ) → Memory.linked t → Memory.sconst t_3 → Memory.addr_le a_1 a → Memory.addr_le a_2 a_3 → A_Strlen.p_valid_str t t_2 a → A_Strlen.p_valid_str t t_3 a_1 → Memory.addr_le a (Memory.shift a_1 x_4) → Memory.addr_le a_3 (Memory.shift a_2 x_4) → Memory.valid_rw t a_4 ((1 : ℤ) + A_Strlen.l_strlen t_3 a_1) → (∀(i : ℤ), (0 : ℤ) ≤ i → i + x_2 < x_3 → t_2 (Memory.shift a_2 i) = t_2 (Memory.shift a_1 i)) → A_Strlen.p_valid_str t m a_2
  := sorry
end stpcpy_Why3_ide_VCstpcpy_assert_3_goal11
