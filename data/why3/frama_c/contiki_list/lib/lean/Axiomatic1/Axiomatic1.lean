import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.contiki_list.lib.lean.Compound.Compound
import frama_c.contiki_list.lib.lean.S1_list.S1_list
open Classical
open Lean4Why3
namespace Axiomatic1
noncomputable def p_unchanged (malloc_0 : ℤ -> ℤ) (mptr_0 : Memory.addr -> Memory.addr) (mflt_0 : Memory.addr -> ℝ) (malloc_1 : ℤ -> ℤ) (mptr_1 : Memory.addr -> Memory.addr) (mflt_1 : Memory.addr -> ℝ) (array_0 : Memory.addr) (down_0 : ℤ) (up_0 : ℤ) := ∀(i : ℤ), let a : Memory.addr := Memory.shift array_0 i; let a_1 : Memory.addr := mptr_0 a; let a_2 : Memory.addr := mptr_1 a; down_0 ≤ i → i < up_0 → a_1 = a_2 ∧ S1_list.eqs1_list (Compound.load_s1_list a_2 mflt_1 mptr_1) (Compound.load_s1_list a_1 mflt_0 mptr_0) ∧ (Memory.valid_rw malloc_1 a_2 (4 : ℤ) → Memory.valid_rw malloc_0 a_1 (4 : ℤ))
noncomputable def p_array_swipe_left (mptr_0 : Memory.addr -> Memory.addr) (mptr_1 : Memory.addr -> Memory.addr) (array_0 : Memory.addr) (down_0 : ℤ) (up_0 : ℤ) := ∀(i : ℤ), down_0 ≤ i → i < up_0 → mptr_1 (Memory.shift array_0 ((1 : ℤ) + i)) = mptr_0 (Memory.shift array_0 i)
noncomputable def p_array_swipe_right (mptr_0 : Memory.addr -> Memory.addr) (mptr_1 : Memory.addr -> Memory.addr) (array_0 : Memory.addr) (down_0 : ℤ) (up_0 : ℤ) := ∀(i : ℤ), down_0 ≤ i → i < up_0 → mptr_1 (Memory.shift array_0 (i - (1 : ℤ))) = mptr_0 (Memory.shift array_0 i)
end Axiomatic1
