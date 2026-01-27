import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import Why3.Cbits.Cbits
import frama_c.x509_parser.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace _parse_arc_Why3_ide_VC_parse_arc_assert_rte_mem_access_part1_goal5
theorem goal5 (a_1 : Memory.addr) (a : Memory.addr) (a_2 : Memory.addr) (i_1 : ℤ) (i : ℤ) (i_2 : ℤ) (t : ℤ -> ℤ) (t_1 : Memory.addr -> ℤ) : let x : ℤ := Memory.addr.base a_1; let x_1 : ℤ := Memory.addr.base a; let x_2 : ℤ := Memory.addr.base a_2; ¬i_1 = (0 : ℤ) → ¬a_2 = a → ¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a_1 → ¬x = x_1 → ¬x_2 = x → (0 : ℤ) ≤ i → (0 : ℤ) ≤ i_1 → Memory.region x_1 ≤ (0 : ℤ) → Memory.region x ≤ (0 : ℤ) → Memory.region x_2 ≤ (0 : ℤ) → i_2 < Cbits.lsl (1 : ℤ) (Cint.to_uint32 ((7 : ℤ) * i)) → i ≤ (3 : ℤ) → i ≤ (4 : ℤ) → (5 : ℤ) ≤ i_1 → Cbits.lsl i_2 (7 : ℤ) ≤ (4294967295 : ℤ) → Memory.linked t → Cint.is_uint16 i → Cint.is_uint16 i_1 → Cint.is_uint32 i_2 → Memory.valid_rw t a (1 : ℤ) → Memory.valid_rw t a_2 (1 : ℤ) → ((0 : ℤ) < i_1 → Memory.valid_rd t (Memory.shift a_1 (0 : ℤ)) i_1) → (∀(i_3 : ℤ), (0 : ℤ) ≤ i_3 → i_3 < i → Cbits.bit_test (t_1 (Memory.shift a_1 i_3)) (7 : ℤ)) → Memory.valid_rd t (Memory.shift a_1 i) (1 : ℤ)
  := sorry
end _parse_arc_Why3_ide_VC_parse_arc_assert_rte_mem_access_part1_goal5
