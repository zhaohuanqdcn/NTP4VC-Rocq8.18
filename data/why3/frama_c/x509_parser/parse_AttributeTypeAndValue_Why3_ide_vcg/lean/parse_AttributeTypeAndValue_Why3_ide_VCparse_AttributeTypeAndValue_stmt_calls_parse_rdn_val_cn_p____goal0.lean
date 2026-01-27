import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.x509_parser.lib.lean.Compound.Compound
import frama_c.x509_parser.lib.lean.Globals.Globals
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace parse_AttributeTypeAndValue_Why3_ide_VCparse_AttributeTypeAndValue_stmt_calls_parse_rdn_val_cn_p____goal0
theorem goal0 (a_2 : Memory.addr) (i_3 : ℤ) (i_2 : ℤ) (i_4 : ℤ) (t_1 : Memory.addr -> Memory.addr) (i : ℤ) (i_1 : ℤ) (a_1 : Memory.addr) (t : ℤ -> ℤ) : let a_3 : Memory.addr := Memory.shift a_2 i_3; let a_4 : Memory.addr := Compound.shift___anonstruct__name_oid_11 (Memory.addr.mk (-(8604 : ℤ)) (0 : ℤ)) i_2; let x : ℤ := i_3 + i_4; let a_5 : Memory.addr := Memory.shift a_4 (2 : ℤ); let a_6 : Memory.addr := t_1 a_5; ¬i = (0 : ℤ) → ¬i_1 = (0 : ℤ) → ¬i_4 = (0 : ℤ) → ¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a_2 → ¬a_3 = Memory.addr.mk (0 : ℤ) (0 : ℤ) → ¬a_4 = Memory.addr.mk (0 : ℤ) (0 : ℤ) → (0 : ℤ) ≤ i → (0 : ℤ) ≤ i_1 → i_3 ≤ i_1 → i_4 ≤ i_1 → (0 : ℤ) ≤ i_2 → (0 : ℤ) ≤ i_4 → i ≤ i_4 → x ≤ i_1 → (0 : ℤ) ≤ x → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_2) ≤ (0 : ℤ) → (2 : ℤ) ≤ i_3 → (3 : ℤ) ≤ i → i_2 ≤ (15 : ℤ) → -(2147483648 : ℤ) ≤ x → x ≤ (65535 : ℤ) → x ≤ (2147483647 : ℤ) → i ≤ (2147483648 : ℤ) + i_4 → i_1 ≤ (65535 : ℤ) + i_3 → i_1 ≤ (2147483647 : ℤ) + i_3 → i_3 ≤ (2147483648 : ℤ) + i_1 → i_4 ≤ (65535 : ℤ) + i → i_4 ≤ (2147483647 : ℤ) + i → Memory.framed t_1 → Memory.linked t → Cint.is_uint16 i → Cint.is_uint16 i_1 → Cint.is_uint16 i_3 → Cint.is_uint16 i_4 → Memory.valid_rw t a_1 (1 : ℤ) → Memory.valid_rd t a_5 (1 : ℤ) → ((0 : ℤ) < i_1 → Memory.valid_rd t (Memory.shift a_2 (0 : ℤ)) i_1) → ((0 : ℤ) < i → Memory.valid_rd t a_3 i) → ((0 : ℤ) < i_4 → Memory.valid_rd t a_3 i_4) → a_6 = Memory.addr.mk (8590 : ℤ) (0 : ℤ) ∨ a_6 = Memory.addr.mk (8593 : ℤ) (0 : ℤ) ∨ a_6 = Memory.addr.mk (8602 : ℤ) (0 : ℤ) ∨ a_6 = Memory.addr.mk (8599 : ℤ) (0 : ℤ) ∨ a_6 = Memory.addr.mk (8594 : ℤ) (0 : ℤ) ∨ a_6 = Memory.addr.mk (8596 : ℤ) (0 : ℤ) ∨ a_6 = Memory.addr.mk (8597 : ℤ) (0 : ℤ) ∨ a_6 = Memory.addr.mk (8603 : ℤ) (0 : ℤ) ∨ a_6 = Memory.addr.mk (8592 : ℤ) (0 : ℤ) ∨ a_6 = Memory.addr.mk (8595 : ℤ) (0 : ℤ) ∨ a_6 = Memory.addr.mk (8598 : ℤ) (0 : ℤ) ∨ a_6 = Memory.addr.mk (8591 : ℤ) (0 : ℤ)
  := sorry
end parse_AttributeTypeAndValue_Why3_ide_VCparse_AttributeTypeAndValue_stmt_calls_parse_rdn_val_cn_p____goal0
