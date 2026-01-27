import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import frama_c.verker.lib.lean.Compound.Compound
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace memmove_Why3_ide_VCmemmove_loop_inv_7_preserved_goal10
theorem goal10 (a_1 : Memory.addr) (a : Memory.addr) (a_2 : Memory.addr) (t_1 : Memory.addr -> ℤ) (t_2 : Memory.addr -> ℤ) (t : ℤ -> ℤ) : let x : ℤ := Memory.addr.offset a_1; let x_1 : ℤ := Memory.addr.offset a; let a_3 : Memory.addr := Memory.shift a_2 (0 : ℤ); let x_3 : ℤ := x - x_1; let a_4 : Memory.addr -> ℤ := Memory.havoc t_1 t_2 a_3 x_3; let x_4 : ℤ := x - (1 : ℤ) - x_1; let a_5 : Memory.addr -> ℤ := Function.update a_4 (Memory.shift a_2 x_4) (a_4 (Memory.shift a_1 (-(1 : ℤ)))); let x_5 : ℤ := Cint.to_uint64 x_4; let a_6 : ℤ := a_5 (Memory.shift a_2 x_5); let a_7 : ℤ := a_5 (Memory.shift a x_5); let a_8 : Memory.addr := Memory.shift a_2 x_3; ¬x = x_1 → a_6 = a_7 → x_1 ≤ x → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_2) ≤ (0 : ℤ) → Memory.linked t → Memory.sconst t_2 → Memory.addr_le a a_1 → ¬Memory.addr_le a_2 a → Cint.is_uint64 x_3 → Memory.valid_rd t (Memory.shift a (0 : ℤ)) x_3 → Memory.valid_rw t a_3 x_3 → Memory.addr_le a_1 (Memory.shift a x_3) → Memory.addr_le a_2 a_8 → Memory.addr_le a_8 a_8 → Cint.is_sint8 a_7 → Cint.is_sint8 a_6 → (∀(i : ℤ), let a_9 : Memory.addr := Memory.shift a i; (0 : ℤ) ≤ i → i + x_1 < x → a_4 a_9 = t_2 a_9) → x_1 + x_5 ≤ x
  := sorry
end memmove_Why3_ide_VCmemmove_loop_inv_7_preserved_goal10
