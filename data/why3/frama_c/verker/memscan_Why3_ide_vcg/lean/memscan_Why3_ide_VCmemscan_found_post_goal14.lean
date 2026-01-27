import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.verker.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace memscan_Why3_ide_VCmemscan_found_post_goal14
theorem goal14 (a_7 : Memory.addr) (a_10 : Memory.addr) (i : ℤ) (t_1 : Memory.addr -> ℤ) (a_2 : Memory.addr) (i_1 : ℤ) (a_6 : Memory.addr) (a_12 : Memory.addr) (t : ℤ -> ℤ) (a_4 : Memory.addr) (a : Memory.addr) (a_1 : Memory.addr) (a_5 : Memory.addr) (a_3 : Memory.addr) (a_11 : Memory.addr) (a_9 : Memory.addr) (a_8 : Memory.addr) : let x : ℤ := Memory.addr.offset a_7; let x_1 : ℤ := Memory.addr.offset a_10; let x_2 : ℤ := i + x_1; let x_3 : ℤ := t_1 (Memory.shift a_2 i_1); let x_4 : ℤ := i + x_1 - x; Memory.addr.base a_10 = Memory.addr.base a_6 → (0 : ℤ) ≤ i → (0 : ℤ) ≤ i_1 → x ≤ x_1 → Memory.region (Memory.addr.base a_12) ≤ (0 : ℤ) → i_1 + x < x_2 → Memory.linked t → Cint.is_uint64 i → Memory.addr_le a_4 a_10 → Cint.is_sint32 x_3 → Cint.is_uint64 x_4 → Memory.valid_rd t (Memory.shift a (0 : ℤ)) x_4 → Memory.valid_rd t (Memory.shift a_1 (0 : ℤ)) x_4 → Memory.addr_le a_10 (Memory.shift a_5 x_4) → i = (0 : ℤ) ∨ x_3 = t_1 a_10 → (∀(i_2 : ℤ), (0 : ℤ) ≤ i_2 → i_2 + x < x_1 → ¬t_1 (Memory.shift a_3 i_2) = x_3) → (∃(i_2 : ℤ), Memory.shift a_12 i_2 = a_11 ∧ t_1 (Memory.shift a_9 i_2) = x_3 ∧ (0 : ℤ) ≤ i_2 ∧ i_2 + x < x_2 ∧ (∀(i_3 : ℤ), (0 : ℤ) ≤ i_3 → i_3 < i_2 → ¬t_1 (Memory.shift a_8 i_3) = x_3))
  := sorry
end memscan_Why3_ide_VCmemscan_found_post_goal14
