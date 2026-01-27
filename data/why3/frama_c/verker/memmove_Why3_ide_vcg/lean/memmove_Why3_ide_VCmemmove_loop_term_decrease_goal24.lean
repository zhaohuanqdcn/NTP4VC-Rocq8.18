import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import frama_c.verker.lib.lean.Compound.Compound
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace memmove_Why3_ide_VCmemmove_loop_term_decrease_goal24
theorem goal24 (a_2 : Memory.addr) (t_1 : Memory.addr -> ℤ) (t_2 : Memory.addr -> ℤ) (i : ℤ) (a_1 : Memory.addr) (a : Memory.addr) (t : ℤ -> ℤ) : let a_3 : Memory.addr := Memory.shift a_2 (0 : ℤ); let a_4 : Memory.addr -> ℤ := Memory.havoc t_1 t_2 a_3 i; let a_5 : Memory.addr -> ℤ := Function.update a_4 a_2 (a_4 a_1); let x : ℤ := Cint.to_uint64 (i - (1 : ℤ)); let x_1 : ℤ := i - (1 : ℤ) - x; let a_6 : ℤ := a_5 (Memory.shift a_2 x_1); let a_7 : ℤ := a_5 (Memory.shift a x_1); ¬i = (0 : ℤ) → Memory.addr.offset a_1 = Memory.addr.offset a → a_6 = a_7 → (0 : ℤ) ≤ i → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_2) ≤ (0 : ℤ) → Memory.linked t → Memory.sconst t_2 → Cint.is_uint64 i → Memory.addr_le a a_1 → Memory.addr_le a_2 a → Memory.addr_le a_2 a_2 → Memory.addr_le a_1 (Memory.shift a i) → Memory.addr_le a_2 (Memory.shift a_2 i) → Memory.valid_rd t (Memory.shift a (0 : ℤ)) i → Memory.valid_rw t a_3 i → Cint.is_sint8 a_7 → Cint.is_sint8 a_6 → (∀(i_1 : ℤ), let a_8 : Memory.addr := Memory.shift a i_1; (0 : ℤ) ≤ i_1 → i_1 < i → a_4 a_8 = t_2 a_8) → x < i
  := sorry
end memmove_Why3_ide_VCmemmove_loop_term_decrease_goal24
