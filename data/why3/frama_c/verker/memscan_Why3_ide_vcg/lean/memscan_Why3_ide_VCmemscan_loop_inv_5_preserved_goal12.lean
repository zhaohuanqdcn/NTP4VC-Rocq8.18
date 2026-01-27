import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.verker.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace memscan_Why3_ide_VCmemscan_loop_inv_5_preserved_goal12
theorem goal12 (t_1 : Memory.addr -> ℤ) (a_7 : Memory.addr) (i_1 : ℤ) (a_8 : Memory.addr) (a_6 : Memory.addr) (i : ℤ) (a_5 : Memory.addr) (a_9 : Memory.addr) (t : ℤ -> ℤ) (a_3 : Memory.addr) (a : Memory.addr) (a_1 : Memory.addr) (a_4 : Memory.addr) (a_2 : Memory.addr) : let x : ℤ := t_1 (Memory.shift a_7 i_1); let x_1 : ℤ := t_1 a_8; let x_2 : ℤ := Memory.addr.offset a_6; let x_3 : ℤ := Memory.addr.offset a_8; let x_4 : ℤ := i + x_3 - x_2; ¬i = (0 : ℤ) → Memory.addr.base a_8 = Memory.addr.base a_5 → ¬x = x_1 → (0 : ℤ) ≤ i → (0 : ℤ) ≤ i_1 → x_2 ≤ x_3 → Memory.region (Memory.addr.base a_9) ≤ (0 : ℤ) → i_1 + x_2 + Cint.to_uint64 (i - (1 : ℤ)) < i + x_3 → Memory.linked t → Cint.is_uint64 i → Memory.addr_le a_3 a_8 → Cint.is_uint8 x_1 → Cint.is_sint32 x → Cint.is_uint64 x_4 → Memory.valid_rd t (Memory.shift a (0 : ℤ)) x_4 → Memory.valid_rd t (Memory.shift a_1 (0 : ℤ)) x_4 → Memory.addr_le a_8 (Memory.shift a_4 x_4) → ¬(∀(i_2 : ℤ), (0 : ℤ) ≤ i_2 → i_2 + x_2 < x_3 → ¬x = t_1 (Memory.shift a_2 i_2))
  := sorry
end memscan_Why3_ide_VCmemscan_loop_inv_5_preserved_goal12
