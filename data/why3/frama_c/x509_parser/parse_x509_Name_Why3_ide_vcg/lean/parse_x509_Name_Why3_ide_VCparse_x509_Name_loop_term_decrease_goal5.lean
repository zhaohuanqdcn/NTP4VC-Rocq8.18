import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.x509_parser.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace parse_x509_Name_Why3_ide_VCparse_x509_Name_loop_term_decrease_goal5
theorem goal5 (a_2 : Memory.addr) (a : Memory.addr) (a_1 : Memory.addr) (i : ℤ) (i_4 : ℤ) (a_3 : Memory.addr) (i_1 : ℤ) (i_2 : ℤ) (i_3 : ℤ) (t : ℤ -> ℤ) : let x : ℤ := Memory.addr.base a_2; let x_1 : ℤ := Memory.addr.base a; let x_2 : ℤ := Memory.addr.base a_1; ¬i = (0 : ℤ) → ¬i_4 = (0 : ℤ) → ¬a_1 = a → ¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a_2 → ¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a_3 → ¬x = x_1 → ¬x = x_2 → (0 : ℤ) ≤ i → i_1 ≤ i → (0 : ℤ) ≤ i_4 → i_2 ≤ i_4 → i_3 ≤ i_4 → i_2 + i_3 ≤ i_4 → Memory.region x_1 ≤ (0 : ℤ) → Memory.region x_2 ≤ (0 : ℤ) → Memory.region x ≤ (0 : ℤ) → (2 : ℤ) ≤ i_1 → (2 : ℤ) ≤ i_2 → i ≤ (65535 : ℤ) + i_1 → i ≤ (2147483647 : ℤ) + i_1 → i_1 ≤ (2147483648 : ℤ) + i → Memory.linked t → Cint.is_uint16 i → Cint.is_uint16 i_1 → Cint.is_uint16 i_2 → Cint.is_uint16 i_3 → Cint.is_uint16 i_4 → Memory.valid_rw t a_1 (1 : ℤ) → Cint.is_uint16 (i - i_1) → Memory.valid_rd t (Memory.shift a_3 (0 : ℤ)) i → ((0 : ℤ) < i_4 → Memory.valid_rd t (Memory.shift a_2 (0 : ℤ)) i_4) → (0 : ℤ) < i_1
  := sorry
end parse_x509_Name_Why3_ide_VCparse_x509_Name_loop_term_decrease_goal5
