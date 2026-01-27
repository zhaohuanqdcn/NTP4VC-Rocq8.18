import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.verker.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace memcmp_Why3_ide_VCmemcmp_loop_inv_4_established_goal9
theorem goal9 (a_15 : Memory.addr) (a_5 : Memory.addr) (a_4 : Memory.addr) (a_3 : Memory.addr) (a_2 : Memory.addr) (a_11 : Memory.addr) (a_10 : Memory.addr) (a_9 : Memory.addr) (a_8 : Memory.addr) (a_17 : Memory.addr) (a_18 : Memory.addr) (t : ℤ -> ℤ) (i : ℤ) (a : Memory.addr) (a_1 : Memory.addr) (a_6 : Memory.addr) (a_7 : Memory.addr) (a_14 : Memory.addr) (a_13 : Memory.addr) (a_16 : Memory.addr) (a_12 : Memory.addr) : let x : ℤ := Memory.addr.offset a_15; (Memory.addr.base a_5 = Memory.addr.base a_4) = (Memory.addr.base a_3 = Memory.addr.base a_2) → (Memory.addr.base a_11 = Memory.addr.base a_10) = (Memory.addr.base a_9 = Memory.addr.base a_8) → Memory.region (Memory.addr.base a_17) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_18) ≤ (0 : ℤ) → Memory.linked t → Cint.is_uint64 i → Memory.valid_rd t (Memory.shift a (0 : ℤ)) i → Memory.valid_rd t (Memory.shift a_1 (0 : ℤ)) i → Memory.valid_rd t (Memory.shift a_6 (0 : ℤ)) i → Memory.valid_rd t (Memory.shift a_7 (0 : ℤ)) i → x = Memory.addr.offset a_14 ∧ Memory.addr.offset a_13 + Memory.addr.offset a_16 = Memory.addr.offset a_12 + x
  := sorry
end memcmp_Why3_ide_VCmemcmp_loop_inv_4_established_goal9
