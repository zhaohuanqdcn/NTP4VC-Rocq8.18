import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import Why3.Cbits.Cbits
import frama_c.x509_parser.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace _parse_arc_Why3_ide_VC_parse_arc_loop_inv_preserved_part1_goal3
theorem goal3 (a_1 : Memory.addr) (a : Memory.addr) (a_2 : Memory.addr) (i : ℤ) (t_1 : Memory.addr -> ℤ) (i_3 : ℤ) (i_1 : ℤ) (i_2 : ℤ) (t : ℤ -> ℤ) : let x : ℤ := Memory.addr.base a_1; let x_1 : ℤ := Memory.addr.base a; let x_2 : ℤ := Memory.addr.base a_2; let a_3 : Memory.addr := Memory.shift a_1 i; let x_3 : ℤ := t_1 a_3; let x_4 : ℤ := Cbits.land (127 : ℤ) x_3; let x_5 : ℤ := Cbits.lsl i_3 (7 : ℤ); let x_6 : ℤ := x_5 + x_4; ¬i_1 = (0 : ℤ) → ¬a_2 = a → ¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a_1 → ¬x = x_1 → ¬x_2 = x → (0 : ℤ) ≤ i → i_2 ≤ i → (0 : ℤ) ≤ i_1 → (0 : ℤ) ≤ i_2 → Memory.region x_1 ≤ (0 : ℤ) → Memory.region x ≤ (0 : ℤ) → Memory.region x_2 ≤ (0 : ℤ) → i_3 < Cbits.lsl (1 : ℤ) (Cint.to_uint32 ((7 : ℤ) * i)) → (0 : ℤ) ≤ x_6 → -(1 : ℤ) ≤ i → i ≤ (3 : ℤ) → i ≤ (4 : ℤ) → (5 : ℤ) ≤ i_1 → i ≤ (65534 : ℤ) → i ≤ (2147483646 : ℤ) → x_5 ≤ (4294967295 : ℤ) → x_6 ≤ (4294967295 : ℤ) → Memory.linked t → Cint.is_uint16 i → Cint.is_uint16 i_1 → Cint.is_uint32 i_3 → Memory.valid_rw t a (1 : ℤ) → Memory.valid_rw t a_2 (1 : ℤ) → Cint.is_uint16 ((1 : ℤ) + i) → Cint.is_uint32 x_5 → Cint.is_uint8 x_3 → Cbits.bit_test x_3 (7 : ℤ) → Memory.valid_rd t a_3 (1 : ℤ) → Cint.is_uint32 x_4 → ((0 : ℤ) < i_1 → Memory.valid_rd t (Memory.shift a_1 (0 : ℤ)) i_1) → (∀(i_4 : ℤ), (0 : ℤ) ≤ i_4 → i_4 < i → Cbits.bit_test (t_1 (Memory.shift a_1 i_4)) (7 : ℤ)) → Cbits.bit_test (t_1 (Memory.shift a_1 i_2)) (7 : ℤ)
  := sorry
end _parse_arc_Why3_ide_VC_parse_arc_loop_inv_preserved_part1_goal3
