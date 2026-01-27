import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import frama_c.verker.lib.lean.Compound.Compound
import frama_c.verker.lib.lean.A_Strlen.A_Strlen
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace strcpy_Why3_ide_VCstrcpy_loop_inv_6_preserved_goal7
theorem goal7 (t_2 : Memory.addr -> ℤ) (a_1 : Memory.addr) (a_2 : Memory.addr) (a : Memory.addr) (a_3 : Memory.addr) (t_1 : Memory.addr -> ℤ) (t_3 : Memory.addr -> ℤ) (i : ℤ) (t : ℤ -> ℤ) : let x : ℤ := t_2 a_1; let x_1 : ℤ := Memory.addr.base a_2; let x_2 : ℤ := Memory.addr.base a; let x_3 : ℤ := Memory.addr.offset a_2; let x_4 : ℤ := Memory.addr.offset a_1; let x_5 : ℤ := A_Strlen.l_strlen t_2 a_2; let a_4 : Memory.addr := Memory.shift a (0 : ℤ); let m : Memory.addr -> ℤ := Function.update t_2 a_3 x; ¬x = (0 : ℤ) → ¬x_1 = x_2 → x_3 + Memory.addr.offset a_3 = Memory.addr.offset a + x_4 → x_3 + x_5 = x_4 + A_Strlen.l_strlen t_2 a_1 → Memory.havoc t_1 t_3 a_4 ((1 : ℤ) + x_5) = t_2 → (0 : ℤ) ≤ i → Memory.region x_2 ≤ (0 : ℤ) → Memory.region x_1 ≤ (0 : ℤ) → i + x_3 ≤ x_4 → Memory.linked t → Memory.sconst t_3 → Memory.addr_le a a_3 → Memory.addr_le a_2 a_1 → Cint.is_sint8 x → A_Strlen.p_valid_str t t_2 a_1 → A_Strlen.p_valid_str t t_3 a_2 → Memory.addr_le a_1 (Memory.shift a_2 x_5) → Memory.addr_le a_3 (Memory.shift a x_5) → Memory.valid_rw t a_4 ((1 : ℤ) + A_Strlen.l_strlen t_3 a_2) → (∀(i_1 : ℤ), (0 : ℤ) ≤ i_1 → i_1 + x_3 < x_4 → t_2 (Memory.shift a_2 i_1) = t_2 (Memory.shift a i_1)) → m (Memory.shift a_2 i) = m (Memory.shift a i)
  := sorry
end strcpy_Why3_ide_VCstrcpy_loop_inv_6_preserved_goal7
