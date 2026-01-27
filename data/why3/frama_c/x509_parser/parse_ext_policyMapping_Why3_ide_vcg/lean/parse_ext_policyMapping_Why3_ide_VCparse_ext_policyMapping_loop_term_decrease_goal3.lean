import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.x509_parser.lib.lean.Compound.Compound
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace parse_ext_policyMapping_Why3_ide_VCparse_ext_policyMapping_loop_term_decrease_goal3
theorem goal3 (a_1 : Memory.addr) (a : Memory.addr) (i_1 : ℤ) (i_5 : ℤ) (i_2 : ℤ) (i : ℤ) (a_2 : Memory.addr) (i_3 : ℤ) (i_6 : ℤ) (i_4 : ℤ) (t : ℤ -> ℤ) : let x : ℤ := Memory.addr.base a_1; let x_1 : ℤ := Memory.addr.base a; let x_2 : ℤ := i_1 + i_5; let x_4 : ℤ := i_2 - i; let a_3 : Memory.addr := Memory.shift a_2 x_4; let a_4 : Memory.addr := Memory.shift a_2 (i_2 - i_1); let x_6 : ℤ := i_1 + i_5 - i; ¬i_2 = (0 : ℤ) → ¬i_3 = (0 : ℤ) → ¬i_5 = (0 : ℤ) → ¬i_6 = (0 : ℤ) → ¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a_1 → ¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a_2 → ¬x = x_1 → ¬x_2 = i → ¬a_3 = Memory.addr.mk (0 : ℤ) (0 : ℤ) → ¬a_4 = Memory.addr.mk (0 : ℤ) (0 : ℤ) → (0 : ℤ) ≤ i → i_5 ≤ i → (0 : ℤ) ≤ i_1 → (0 : ℤ) ≤ i_2 → i_5 ≤ i_2 → (0 : ℤ) ≤ i_3 → i_4 ≤ i_3 → (0 : ℤ) ≤ i_4 → (0 : ℤ) ≤ i_5 → i ≤ x_2 → Memory.region x_1 ≤ (0 : ℤ) → Memory.region x ≤ (0 : ℤ) → -(2147483648 : ℤ) ≤ i → -(2147483648 : ℤ) ≤ i_1 → -(2147483648 : ℤ) ≤ i_3 → (2 : ℤ) ≤ i_4 → i ≤ (65535 : ℤ) → i_1 ≤ (65535 : ℤ) → i ≤ (2147483647 : ℤ) → i_1 ≤ (2147483647 : ℤ) → i_3 ≤ (2147483647 : ℤ) → (3 : ℤ) + i_1 ≤ i → i ≤ (65535 : ℤ) + i_5 → i ≤ (2147483647 : ℤ) + i_5 → (2 : ℤ) + i ≤ i_2 → i_5 ≤ (2147483648 : ℤ) + i → (3 : ℤ) + i ≤ x_2 → x_2 ≤ (65535 : ℤ) + i → x_2 ≤ (2147483647 : ℤ) + i → i ≤ (2147483648 : ℤ) + i_1 + i_5 → Memory.linked t → Cint.is_uint16 i → Cint.is_uint16 i_1 → Cint.is_uint16 i_2 → Cint.is_uint16 i_3 → Cint.is_uint16 i_4 → Cint.is_uint16 i_5 → Cint.is_sint32 i_6 → Memory.valid_rw t a (15 : ℤ) → Cint.is_uint16 (i - i_1) → Cint.is_uint16 (i - i_5) → Cint.is_uint16 x_4 → Cint.is_uint16 (i_3 - i_4) → Memory.valid_rd t (Memory.shift a_2 (0 : ℤ)) i_2 → Cint.is_uint16 x_6 → ((0 : ℤ) < i_3 → Memory.valid_rd t (Memory.shift a_1 (0 : ℤ)) i_3) → ((0 : ℤ) < i_5 → Memory.valid_rd t a_3 i_5) → (i < x_2 → Memory.valid_rd t a_4 x_6) → i < i_2 + i_5
  := sorry
end parse_ext_policyMapping_Why3_ide_VCparse_ext_policyMapping_loop_term_decrease_goal3
