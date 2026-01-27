import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.contiki_list.lib.lean.Compound.Compound
import frama_c.contiki_list.lib.lean.S1_list.S1_list
import Why3.Cint.Cint
import frama_c.contiki_list.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace array_push_Why3_ide_VCarray_push_assign_part4_goal46
theorem goal46 (i_1 : ℤ) (i : ℤ) (a_3 : Memory.addr) (a : Memory.addr) (a_1 : Memory.addr) (a_2 : Memory.addr) (t_1 : Memory.addr -> Memory.addr) (t : ℤ -> ℤ) : let x_1 : ℤ := i_1 - i; let a_4 : Memory.addr := Memory.shift a_3 (0 : ℤ); let a_5 : Memory.addr := Memory.shift a_3 ((1 : ℤ) + i_1 - i); ¬i = (0 : ℤ) → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_2) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_3) ≤ (0 : ℤ) → i_1 ≤ (2147483645 : ℤ) → Memory.framed t_1 → Memory.linked t → Cint.is_sint32 i → Cint.is_sint32 i_1 → Memory.valid_rw t a_1 (1 : ℤ) → Cint.is_sint32 x_1 → Memory.valid_rw t a_4 (2147483646 : ℤ) → Memory.separated a_1 (1 : ℤ) a_4 (2147483646 : ℤ) → Memory.separated (t_1 a_1) (4 : ℤ) a_4 (2147483646 : ℤ) → ¬Memory.invalid t a_5 i → Axiomatic.p_linked_n t t_1 a a_3 x_1 i a_2 → (∀(i_2 : ℤ), i_2 < i_1 → i_1 ≤ i_2 + i → Memory.separated a_1 (1 : ℤ) (t_1 (Memory.shift a_3 i_2)) (4 : ℤ)) → (∀(i_2 : ℤ), i_2 < i_1 → i_1 ≤ i_2 + i → Memory.separated (t_1 (Memory.shift a_3 i_2)) (4 : ℤ) a_4 (2147483646 : ℤ)) → (∀(i_3 : ℤ) (i_2 : ℤ), ¬i_3 = i_2 → i_2 < i_1 → i_3 < i_1 → i_1 ≤ i_2 + i → i_1 ≤ i_3 + i → ¬t_1 (Memory.shift a_3 i_3) = t_1 (Memory.shift a_3 i_2)) → (∀(i_3 : ℤ) (i_2 : ℤ), ¬i_3 = i_2 → i_2 < i_1 → i_3 < i_1 → i_1 ≤ i_2 + i → i_1 ≤ i_3 + i → Memory.separated (t_1 (Memory.shift a_3 i_3)) (4 : ℤ) (t_1 (Memory.shift a_3 i_2)) (4 : ℤ)) → Memory.included a_5 i (Memory.shift a_3 x_1) ((1 : ℤ) + i)
  := sorry
end array_push_Why3_ide_VCarray_push_assign_part4_goal46
