import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.contiki_list.lib.lean.Compound.Compound
import frama_c.contiki_list.lib.lean.S1_list.S1_list
import frama_c.contiki_list.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace list_chop_Why3_ide_VClist_chop_post_Separation_2_part1_goal15
theorem goal15 (t_1 : Memory.addr -> Memory.addr) (a : Memory.addr) (i : ℤ) (i_1 : ℤ) (a_1 : Memory.addr) (i_3 : ℤ) (i_2 : ℤ) (t : ℤ -> ℤ) : let a_2 : Memory.addr := t_1 a; let x : ℤ := i + i_1; let a_3 : Memory.addr := Memory.shift a_1 (0 : ℤ); ¬i_3 = i_2 → a_2 = Memory.addr.mk (0 : ℤ) (0 : ℤ) → i_1 ≤ i_2 → i_1 ≤ i_3 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → (2 : ℤ) + i_2 ≤ x → (2 : ℤ) + i_3 ≤ x → Memory.framed t_1 → Memory.linked t → Cint.is_sint32 i → Cint.is_sint32 i_1 → Memory.valid_rw t a (1 : ℤ) → Memory.valid_rw t a_3 (2147483646 : ℤ) → Memory.separated a (1 : ℤ) a_3 (2147483646 : ℤ) → Memory.separated a_2 (4 : ℤ) a_3 (2147483646 : ℤ) → Axiomatic.p_linked_n t t_1 a_2 a_1 i_1 i a_2 → (∀(i_4 : ℤ), i_1 ≤ i_4 → i_4 < x → Memory.separated a (1 : ℤ) (t_1 (Memory.shift a_1 i_4)) (4 : ℤ)) → (∀(i_4 : ℤ), i_1 ≤ i_4 → i_4 < x → Memory.separated (t_1 (Memory.shift a_1 i_4)) (4 : ℤ) a_3 (2147483646 : ℤ)) → (∀(i_5 : ℤ) (i_4 : ℤ), ¬i_5 = i_4 → i_1 ≤ i_4 → i_1 ≤ i_5 → i_4 < x → i_5 < x → ¬t_1 (Memory.shift a_1 i_5) = t_1 (Memory.shift a_1 i_4)) → (∀(i_5 : ℤ) (i_4 : ℤ), ¬i_5 = i_4 → i_1 ≤ i_4 → i_1 ≤ i_5 → i_4 < x → i_5 < x → Memory.separated (t_1 (Memory.shift a_1 i_5)) (4 : ℤ) (t_1 (Memory.shift a_1 i_4)) (4 : ℤ)) → Memory.separated (t_1 (Memory.shift a_1 i_3)) (4 : ℤ) (t_1 (Memory.shift a_1 i_2)) (4 : ℤ)
  := sorry
end list_chop_Why3_ide_VClist_chop_post_Separation_2_part1_goal15
