import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.verker.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace memscan_Why3_ide_VCmemscan_post_goal2
theorem goal2 (a_6 : Memory.addr) (a_7 : Memory.addr) (a_10 : Memory.addr) (t_1 : Memory.addr -> ℤ) (a_8 : Memory.addr) (i : ℤ) (a_5 : Memory.addr) (t : ℤ -> ℤ) (i_1 : ℤ) (a_3 : Memory.addr) (a : Memory.addr) (a_1 : Memory.addr) (a_4 : Memory.addr) (a_2 : Memory.addr) (a_9 : Memory.addr) : let x : ℤ := Memory.addr.offset a_6; let x_1 : ℤ := Memory.addr.offset a_7; let x_2 : ℤ := Memory.addr.base a_10; let x_3 : ℤ := t_1 a_8; let x_4 : ℤ := i + x_1 - x; Memory.addr.base a_7 = Memory.addr.base a_5 → (0 : ℤ) ≤ i → x ≤ x_1 → Memory.region x_2 ≤ (0 : ℤ) → Memory.linked t → Cint.is_sint32 i_1 → Cint.is_uint64 i → Memory.addr_le a_3 a_7 → Cint.is_uint8 x_3 → Cint.is_uint64 x_4 → Memory.valid_rd t (Memory.shift a (0 : ℤ)) x_4 → Memory.valid_rd t (Memory.shift a_1 (0 : ℤ)) x_4 → Memory.addr_le a_7 (Memory.shift a_4 x_4) → i = (0 : ℤ) ∨ a_8 = a_7 ∧ x_3 = i_1 → (∀(i_2 : ℤ), (0 : ℤ) ≤ i_2 → i_2 + x < x_1 → ¬t_1 (Memory.shift a_2 i_2) = i_1) → x_2 = Memory.addr.base a_9
  := sorry
end memscan_Why3_ide_VCmemscan_post_goal2
