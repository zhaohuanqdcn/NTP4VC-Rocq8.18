import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.x509_parser.lib.lean.Compound.Compound
import frama_c.x509_parser.lib.lean.Globals.Globals
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace parse_AttributeTypeAndValue_Why3_ide_VCparse_AttributeTypeAndValue_post_part52_goal9
theorem goal9 (a_2 : Memory.addr) (i_4 : ℤ) (i_1 : ℤ) (i_3 : ℤ) (i : ℤ) (i_2 : ℤ) (t_1 : Memory.addr -> Memory.addr) (a_1 : Memory.addr) (t : ℤ -> ℤ) : let a_3 : Memory.addr := Memory.shift a_2 i_4; let x : ℤ := i_1 + i_4; let a_4 : Memory.addr := Compound.shift___anonstruct__name_oid_11 (Memory.addr.mk (-(8604 : ℤ)) (0 : ℤ)) i_3; let a_5 : Memory.addr := Memory.shift a_2 x; let a_6 : Memory.addr := Memory.shift a_4 (2 : ℤ); let x_2 : ℤ := i - i_4; let x_3 : ℤ := i - i_1 - i_4; ¬i_1 = (0 : ℤ) → ¬i_2 = (0 : ℤ) → ¬i_4 = i → ¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a_2 → ¬a_3 = Memory.addr.mk (0 : ℤ) (0 : ℤ) → ¬x = i → ¬a_4 = Memory.addr.mk (0 : ℤ) (0 : ℤ) → ¬a_5 = Memory.addr.mk (0 : ℤ) (0 : ℤ) → t_1 a_6 = Memory.addr.mk (8598 : ℤ) (0 : ℤ) → (0 : ℤ) ≤ i → i_4 ≤ i → (0 : ℤ) ≤ i_1 → (0 : ℤ) ≤ i_2 → i ≤ i_2 → i_4 ≤ i_2 → (0 : ℤ) ≤ i_3 → x ≤ i → i ≤ i_2 + i_4 → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_2) ≤ (0 : ℤ) → -(2147483648 : ℤ) ≤ i → (2 : ℤ) ≤ i_4 → (3 : ℤ) ≤ i_1 → i_3 ≤ (15 : ℤ) → i ≤ (65535 : ℤ) → i ≤ (2147483647 : ℤ) → i_2 ≤ (65535 : ℤ) + i_4 → i_2 ≤ (2147483647 : ℤ) + i_4 → i_4 ≤ (2147483648 : ℤ) + i_2 → x ≤ (2147483648 : ℤ) + i → i ≤ (65535 : ℤ) + i_1 + i_4 → i ≤ (2147483647 : ℤ) + i_1 + i_4 → Memory.framed t_1 → Memory.linked t → Cint.is_uint16 i → Cint.is_uint16 i_1 → Cint.is_uint16 i_2 → Cint.is_uint16 i_4 → Memory.valid_rw t a_1 (1 : ℤ) → Cint.is_uint16 x_2 → Cint.is_uint16 x_3 → Memory.valid_rd t a_6 (1 : ℤ) → ((0 : ℤ) < i_2 → Memory.valid_rd t (Memory.shift a_2 (0 : ℤ)) i_2) → ((0 : ℤ) < i_1 → Memory.valid_rd t a_3 i_1) → (i_4 < i → Memory.valid_rd t a_3 x_2) → (x < i → Memory.valid_rd t a_5 x_3) → (2 : ℤ) ≤ i
  := sorry
end parse_AttributeTypeAndValue_Why3_ide_VCparse_AttributeTypeAndValue_post_part52_goal9
