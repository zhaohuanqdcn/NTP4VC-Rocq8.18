import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.contiki_list.lib.lean.Compound.Compound
import frama_c.contiki_list.lib.lean.S1_list.S1_list
import Why3.Cint.Cint
import frama_c.contiki_list.lib.lean.Axiomatic.Axiomatic
import frama_c.contiki_list.lib.lean.Axiomatic1.Axiomatic1
open Classical
open Lean4Why3
namespace array_pop_Why3_ide_VCarray_pop_loop_inv_UnchangedLeft_established_goal21
theorem goal21 (a_3 : Memory.addr) (i : ℤ) (i_2 : ℤ) (i_1 : ℤ) (a : Memory.addr) (a_1 : Memory.addr) (a_2 : Memory.addr) (t_2 : Memory.addr -> Memory.addr) (t : ℤ -> ℤ) (t_1 : Memory.addr -> ℝ) : let a_4 : Memory.addr := Memory.shift a_3 (0 : ℤ); let x : ℤ := i + i_2; (0 : ℤ) < i → (0 : ℤ) ≤ i_1 → i_1 ≤ i_2 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_2) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_3) ≤ (0 : ℤ) → Memory.framed t_2 → Memory.linked t → Cint.is_sint32 i → Cint.is_sint32 i_1 → Cint.is_sint32 i_2 → Memory.valid_rw t a_4 (2147483646 : ℤ) → Memory.separated a_1 (1 : ℤ) a_4 (2147483646 : ℤ) → Memory.separated (t_2 a_1) (4 : ℤ) a_4 (2147483646 : ℤ) → Axiomatic.p_linked_n t t_2 a a_3 i_2 i a_2 → Axiomatic.p_linked_n t t_2 (t_2 (Memory.shift a_3 i_1)) a_3 i_1 (i_2 - i_1) a → (∀(i_3 : ℤ), i_1 ≤ i_3 → i_3 < x → Memory.separated a_1 (1 : ℤ) (t_2 (Memory.shift a_3 i_3)) (4 : ℤ)) → (∀(i_3 : ℤ), i_1 ≤ i_3 → i_3 < x → Memory.separated (t_2 (Memory.shift a_3 i_3)) (4 : ℤ) a_4 (2147483646 : ℤ)) → (∀(i_4 : ℤ) (i_3 : ℤ), ¬i_4 = i_3 → i_1 ≤ i_3 → i_1 ≤ i_4 → i_3 < x → i_4 < x → ¬t_2 (Memory.shift a_3 i_4) = t_2 (Memory.shift a_3 i_3)) → (∀(i_4 : ℤ) (i_3 : ℤ), ¬i_4 = i_3 → i_1 ≤ i_3 → i_1 ≤ i_4 → i_3 < x → i_4 < x → Memory.separated (t_2 (Memory.shift a_3 i_4)) (4 : ℤ) (t_2 (Memory.shift a_3 i_3)) (4 : ℤ)) → Axiomatic1.p_unchanged t t_2 t_1 t t_2 t_1 a_3 i_1 i_2
  := sorry
end array_pop_Why3_ide_VCarray_pop_loop_inv_UnchangedLeft_established_goal21
