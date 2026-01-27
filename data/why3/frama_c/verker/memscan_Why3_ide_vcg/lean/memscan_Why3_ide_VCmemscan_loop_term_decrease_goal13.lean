import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.verker.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace memscan_Why3_ide_VCmemscan_loop_term_decrease_goal13
theorem goal13 (t_1 : Memory.addr -> ℤ) (a_7 : Memory.addr) (a_6 : Memory.addr) (i : ℤ) (i_1 : ℤ) (a_5 : Memory.addr) (a_8 : Memory.addr) (t : ℤ -> ℤ) (a_3 : Memory.addr) (a : Memory.addr) (a_1 : Memory.addr) (a_4 : Memory.addr) (a_2 : Memory.addr) : let x : ℤ := t_1 a_7; let x_1 : ℤ := Memory.addr.offset a_6; let x_2 : ℤ := Memory.addr.offset a_7; let x_3 : ℤ := i + x_2 - x_1; ¬i = (0 : ℤ) → ¬x = i_1 → Memory.addr.base a_7 = Memory.addr.base a_5 → (0 : ℤ) ≤ i → x_1 ≤ x_2 → Memory.region (Memory.addr.base a_8) ≤ (0 : ℤ) → Memory.linked t → Cint.is_sint32 i_1 → Cint.is_uint64 i → Memory.addr_le a_3 a_7 → Cint.is_uint8 x → Cint.is_uint64 x_3 → Memory.valid_rd t (Memory.shift a (0 : ℤ)) x_3 → Memory.valid_rd t (Memory.shift a_1 (0 : ℤ)) x_3 → Memory.addr_le a_7 (Memory.shift a_4 x_3) → (∀(i_2 : ℤ), (0 : ℤ) ≤ i_2 → i_2 + x_1 < x_2 → ¬t_1 (Memory.shift a_2 i_2) = i_1) → Cint.to_uint64 (i - (1 : ℤ)) < i
  := sorry
end memscan_Why3_ide_VCmemscan_loop_term_decrease_goal13
