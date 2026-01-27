import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.verker.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace memcmp_Why3_ide_VCmemcmp_loop_inv_4_preserved_goal8
theorem goal8 (t_1 : Memory.addr -> ℤ) (a_25 : Memory.addr) (a_24 : Memory.addr) (a_16 : Memory.addr) (i : ℤ) (a_5 : Memory.addr) (a_4 : Memory.addr) (a_3 : Memory.addr) (a_2 : Memory.addr) (a_11 : Memory.addr) (a_10 : Memory.addr) (a_9 : Memory.addr) (a_8 : Memory.addr) (a_15 : Memory.addr) (a_14 : Memory.addr) (a_26 : Memory.addr) (a_27 : Memory.addr) (t : ℤ -> ℤ) (a_17 : Memory.addr) (a_19 : Memory.addr) (a : Memory.addr) (a_1 : Memory.addr) (a_6 : Memory.addr) (a_7 : Memory.addr) (a_18 : Memory.addr) (a_20 : Memory.addr) (a_13 : Memory.addr) (a_12 : Memory.addr) (a_22 : Memory.addr) (a_21 : Memory.addr) (a_23 : Memory.addr) : let x : ℤ := t_1 a_25; let x_1 : ℤ := t_1 a_24; let x_2 : ℤ := Memory.addr.offset a_25; let x_3 : ℤ := Memory.addr.offset a_24; let x_4 : ℤ := Memory.addr.offset a_16; let x_5 : ℤ := i + x_3 - x_4; x = x_1 → (Memory.addr.base a_5 = Memory.addr.base a_4) = (Memory.addr.base a_3 = Memory.addr.base a_2) → (Memory.addr.base a_11 = Memory.addr.base a_10) = (Memory.addr.base a_9 = Memory.addr.base a_8) → Memory.addr.offset a_15 + x_2 = Memory.addr.offset a_14 + x_3 → (0 : ℤ) < i → (0 : ℤ) ≤ i → x_4 ≤ x_3 → Memory.region (Memory.addr.base a_26) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_27) ≤ (0 : ℤ) → Memory.linked t → Cint.is_uint64 i → Memory.addr_le a_17 a_24 → Memory.addr_le a_19 a_25 → Cint.is_uint8 x_1 → Cint.is_uint8 x → Cint.is_uint64 x_5 → Memory.valid_rd t (Memory.shift a (0 : ℤ)) x_5 → Memory.valid_rd t (Memory.shift a_1 (0 : ℤ)) x_5 → Memory.valid_rd t (Memory.shift a_6 (0 : ℤ)) x_5 → Memory.valid_rd t (Memory.shift a_7 (0 : ℤ)) x_5 → Memory.addr_le a_24 (Memory.shift a_18 x_5) → Memory.addr_le a_25 (Memory.shift a_20 x_5) → (∀(i_1 : ℤ), (0 : ℤ) ≤ i_1 → i_1 + x_4 < x_3 → t_1 (Memory.shift a_13 i_1) = t_1 (Memory.shift a_12 i_1)) → Memory.addr.offset a_22 + x_2 = Memory.addr.offset a_21 + x_3 ∧ (1 : ℤ) + x_4 + Cint.to_uint64 (i - (1 : ℤ)) = i + Memory.addr.offset a_23
  := sorry
end memcmp_Why3_ide_VCmemcmp_loop_inv_4_preserved_goal8
