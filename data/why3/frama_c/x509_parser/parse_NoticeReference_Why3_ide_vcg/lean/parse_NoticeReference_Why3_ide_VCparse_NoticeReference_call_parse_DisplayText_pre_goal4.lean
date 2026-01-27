import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.x509_parser.lib.lean.Compound.Compound
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace parse_NoticeReference_Why3_ide_VCparse_NoticeReference_call_parse_DisplayText_pre_goal4
theorem goal4 (a_1 : Memory.addr) (a : Memory.addr) (i_2 : ℤ) (i : ℤ) (i_1 : ℤ) (t : ℤ -> ℤ) : let x : ℤ := Memory.addr.base a_1; let x_1 : ℤ := Memory.addr.base a; let a_2 : Memory.addr := Memory.shift a_1 i_2; let x_2 : ℤ := i + i_2; ¬i_1 = (0 : ℤ) → ¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a_1 → ¬x = x_1 → ¬a_2 = Memory.addr.mk (0 : ℤ) (0 : ℤ) → (0 : ℤ) < i → (0 : ℤ) ≤ i_1 → i ≤ i_1 → i_2 ≤ i_1 → x_2 ≤ i_1 → (0 : ℤ) ≤ x_2 → Memory.region x_1 ≤ (0 : ℤ) → Memory.region x ≤ (0 : ℤ) → (2 : ℤ) ≤ i_2 → -(2147483648 : ℤ) ≤ x_2 → x_2 ≤ (65535 : ℤ) → x_2 ≤ (2147483647 : ℤ) → Memory.linked t → Cint.is_uint16 i → Cint.is_uint16 i_1 → Cint.is_uint16 i_2 → Memory.valid_rw t a (1 : ℤ) → ((0 : ℤ) < i_1 → Memory.valid_rd t (Memory.shift a_1 (0 : ℤ)) i_1) → Memory.valid_rd t a_2 i
  := sorry
end parse_NoticeReference_Why3_ide_VCparse_NoticeReference_call_parse_DisplayText_pre_goal4
