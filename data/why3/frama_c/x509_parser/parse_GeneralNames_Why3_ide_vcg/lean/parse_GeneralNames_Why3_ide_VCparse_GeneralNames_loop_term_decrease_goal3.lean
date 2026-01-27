import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.x509_parser.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace parse_GeneralNames_Why3_ide_VCparse_GeneralNames_loop_term_decrease_goal3
theorem goal3 (a_1 : Memory.addr) (a : Memory.addr) (i_1 : ℤ) (i_3 : ℤ) (a_2 : Memory.addr) (i : ℤ) (i_2 : ℤ) (i_4 : ℤ) (i_5 : ℤ) (t : ℤ -> ℤ) : let x : ℤ := Memory.addr.base a_1; let x_1 : ℤ := Memory.addr.base a; ¬i_1 = (0 : ℤ) → ¬i_3 = (0 : ℤ) → ¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a_1 → ¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a_2 → ¬x = x_1 → (0 : ℤ) ≤ i → (0 : ℤ) ≤ i_1 → i_2 ≤ i_1 → (0 : ℤ) ≤ i_3 → i_4 ≤ i_3 → i_5 ≤ i_3 → i_4 + i_5 ≤ i_3 → Memory.region x_1 ≤ (0 : ℤ) → Memory.region x ≤ (0 : ℤ) → i ≤ (1 : ℤ) → (2 : ℤ) ≤ i_2 → (2 : ℤ) ≤ i_4 → i_1 ≤ (65535 : ℤ) + i_2 → i_1 ≤ (2147483647 : ℤ) + i_2 → i_2 ≤ (2147483648 : ℤ) + i_1 → Memory.linked t → Cint.is_uint16 i_1 → Cint.is_uint16 i_2 → Cint.is_uint16 i_3 → Cint.is_uint16 i_4 → Cint.is_uint16 i_5 → Cint.is_sint32 i → Memory.valid_rw t a (1 : ℤ) → Cint.is_uint16 (i_1 - i_2) → Memory.valid_rd t (Memory.shift a_2 (0 : ℤ)) i_1 → ((0 : ℤ) < i_3 → Memory.valid_rd t (Memory.shift a_1 (0 : ℤ)) i_3) → (0 : ℤ) < i_2
  := sorry
end parse_GeneralNames_Why3_ide_VCparse_GeneralNames_loop_term_decrease_goal3
