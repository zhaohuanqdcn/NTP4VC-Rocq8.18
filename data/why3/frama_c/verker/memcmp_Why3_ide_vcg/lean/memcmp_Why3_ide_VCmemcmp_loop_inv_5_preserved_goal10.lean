import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.verker.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace memcmp_Why3_ide_VCmemcmp_loop_inv_5_preserved_goal10
theorem goal10 (t_1 : Memory.addr -> ℤ) (a_24 : Memory.addr) (a_23 : Memory.addr) (a_16 : Memory.addr) (i_1 : ℤ) (a_5 : Memory.addr) (a_4 : Memory.addr) (a_3 : Memory.addr) (a_2 : Memory.addr) (a_11 : Memory.addr) (a_10 : Memory.addr) (a_9 : Memory.addr) (a_8 : Memory.addr) (a_15 : Memory.addr) (a_14 : Memory.addr) (i : ℤ) (a_25 : Memory.addr) (a_26 : Memory.addr) (t : ℤ -> ℤ) (a_17 : Memory.addr) (a_19 : Memory.addr) (a : Memory.addr) (a_1 : Memory.addr) (a_6 : Memory.addr) (a_7 : Memory.addr) (a_18 : Memory.addr) (a_20 : Memory.addr) (a_13 : Memory.addr) (a_12 : Memory.addr) (a_22 : Memory.addr) (a_21 : Memory.addr) : let x : ℤ := t_1 a_24; let x_1 : ℤ := t_1 a_23; let x_2 : ℤ := Memory.addr.offset a_23; let x_3 : ℤ := Memory.addr.offset a_16; let x_4 : ℤ := i_1 + x_2 - x_3; x = x_1 → (Memory.addr.base a_5 = Memory.addr.base a_4) = (Memory.addr.base a_3 = Memory.addr.base a_2) → (Memory.addr.base a_11 = Memory.addr.base a_10) = (Memory.addr.base a_9 = Memory.addr.base a_8) → Memory.addr.offset a_15 + Memory.addr.offset a_24 = Memory.addr.offset a_14 + x_2 → (0 : ℤ) < i_1 → (0 : ℤ) ≤ i → (0 : ℤ) ≤ i_1 → x_3 ≤ x_2 → Memory.region (Memory.addr.base a_25) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_26) ≤ (0 : ℤ) → i + x_3 + Cint.to_uint64 (i_1 - (1 : ℤ)) < i_1 + x_2 → Memory.linked t → Cint.is_uint64 i_1 → Memory.addr_le a_17 a_23 → Memory.addr_le a_19 a_24 → Cint.is_uint8 x_1 → Cint.is_uint8 x → Cint.is_uint64 x_4 → Memory.valid_rd t (Memory.shift a (0 : ℤ)) x_4 → Memory.valid_rd t (Memory.shift a_1 (0 : ℤ)) x_4 → Memory.valid_rd t (Memory.shift a_6 (0 : ℤ)) x_4 → Memory.valid_rd t (Memory.shift a_7 (0 : ℤ)) x_4 → Memory.addr_le a_23 (Memory.shift a_18 x_4) → Memory.addr_le a_24 (Memory.shift a_20 x_4) → (∀(i_2 : ℤ), (0 : ℤ) ≤ i_2 → i_2 + x_3 < x_2 → t_1 (Memory.shift a_13 i_2) = t_1 (Memory.shift a_12 i_2)) → t_1 (Memory.shift a_22 i) = t_1 (Memory.shift a_21 i)
  := sorry
end memcmp_Why3_ide_VCmemcmp_loop_inv_5_preserved_goal10
