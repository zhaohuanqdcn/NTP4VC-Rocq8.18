import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.contiki_list.lib.lean.Compound.Compound
import frama_c.contiki_list.lib.lean.S1_list.S1_list
import frama_c.contiki_list.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace list_chop_Why3_ide_VClist_chop_loop_inv_2_preserved_goal25
theorem goal25 (t_1 : Memory.addr -> Memory.addr) (a : Memory.addr) (i_1 : ℤ) (i_2 : ℤ) (a_1 : Memory.addr) (i : ℤ) (t : ℤ -> ℤ) : let a_2 : Memory.addr := t_1 a; let x : ℤ := i_1 + i_2; let a_3 : Memory.addr := t_1 (Memory.shift a_1 x); let a_4 : Memory.addr := t_1 (Memory.shift a_3 (0 : ℤ)); let a_5 : Memory.addr := Memory.shift a_1 (0 : ℤ); let x_1 : ℤ := i + i_1; ¬a_2 = Memory.addr.mk (0 : ℤ) (0 : ℤ) → ¬t_1 (Memory.shift a_2 (0 : ℤ)) = Memory.addr.mk (0 : ℤ) (0 : ℤ) → ¬t_1 (Memory.shift a_4 (0 : ℤ)) = Memory.addr.mk (0 : ℤ) (0 : ℤ) → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → (2 : ℤ) + i_2 ≤ i → Memory.framed t_1 → Memory.linked t → Cint.is_sint32 i → Cint.is_sint32 i_1 → Cint.is_sint32 i_2 → Memory.valid_rw t a (1 : ℤ) → Cint.is_sint32 ((1 : ℤ) + i_2) → Memory.valid_rw t a_5 (2147483646 : ℤ) → Memory.separated a (1 : ℤ) a_5 (2147483646 : ℤ) → Memory.separated a_2 (4 : ℤ) a_5 (2147483646 : ℤ) → Axiomatic.p_linked_n t t_1 a_2 a_1 i_1 i (Memory.addr.mk (0 : ℤ) (0 : ℤ)) → Memory.valid_rw t a_4 (4 : ℤ) → Axiomatic.p_linked_n t t_1 a_3 a_1 x (i - i_2) (Memory.addr.mk (0 : ℤ) (0 : ℤ)) → (∀(i_3 : ℤ), i_1 ≤ i_3 → i_3 < x_1 → Memory.separated a (1 : ℤ) (t_1 (Memory.shift a_1 i_3)) (4 : ℤ)) → (∀(i_3 : ℤ), i_1 ≤ i_3 → i_3 < x_1 → Memory.separated (t_1 (Memory.shift a_1 i_3)) (4 : ℤ) a_5 (2147483646 : ℤ)) → (∀(i_4 : ℤ) (i_3 : ℤ), ¬i_4 = i_3 → i_1 ≤ i_3 → i_1 ≤ i_4 → i_3 < x_1 → i_4 < x_1 → ¬t_1 (Memory.shift a_1 i_4) = t_1 (Memory.shift a_1 i_3)) → (∀(i_4 : ℤ) (i_3 : ℤ), ¬i_4 = i_3 → i_1 ≤ i_3 → i_1 ≤ i_4 → i_3 < x_1 → i_4 < x_1 → Memory.separated (t_1 (Memory.shift a_1 i_4)) (4 : ℤ) (t_1 (Memory.shift a_1 i_3)) (4 : ℤ)) → (3 : ℤ) + i_2 ≤ i
  := sorry
end list_chop_Why3_ide_VClist_chop_loop_inv_2_preserved_goal25
