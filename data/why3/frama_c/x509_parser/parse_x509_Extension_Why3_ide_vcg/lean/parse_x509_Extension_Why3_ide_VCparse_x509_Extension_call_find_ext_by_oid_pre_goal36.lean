import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.x509_parser.lib.lean.Compound.Compound
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace parse_x509_Extension_Why3_ide_VCparse_x509_Extension_call_find_ext_by_oid_pre_goal36
theorem goal36 (a_3 : Memory.addr) (i_2 : ℤ) (i_3 : ℤ) (i_1 : ℤ) (i : ℤ) (a : Memory.addr) (a_1 : Memory.addr) (a_2 : Memory.addr) (t_1 : Memory.addr -> Memory.addr) (t : ℤ -> ℤ) : let a_4 : Memory.addr := Memory.shift a_3 i_2; let x : ℤ := i_2 + i_3; ¬i_1 = (0 : ℤ) → ¬i_3 = (0 : ℤ) → ¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a_3 → ¬a_4 = Memory.addr.mk (0 : ℤ) (0 : ℤ) → (0 : ℤ) < i → (0 : ℤ) ≤ i_1 → i_2 ≤ i_1 → i_3 ≤ i_1 → (0 : ℤ) ≤ i_3 → i ≤ i_3 → x ≤ i_1 → (0 : ℤ) ≤ x → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_2) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_3) ≤ (0 : ℤ) → (2 : ℤ) ≤ i_2 → (3 : ℤ) ≤ i → -(2147483648 : ℤ) ≤ x → x ≤ (65535 : ℤ) → x ≤ (2147483647 : ℤ) → i_1 ≤ (65535 : ℤ) + i_2 → i_1 ≤ (2147483647 : ℤ) + i_2 → i_2 ≤ (2147483648 : ℤ) + i_1 → Memory.framed t_1 → Memory.linked t → Cint.is_uint16 i → Cint.is_uint16 i_1 → Cint.is_uint16 i_2 → Cint.is_uint16 i_3 → Memory.valid_rw t a (1 : ℤ) → Memory.valid_rw t a_1 (1 : ℤ) → Memory.valid_rw t a_2 (15 : ℤ) → ((0 : ℤ) < i_1 → Memory.valid_rd t (Memory.shift a_3 (0 : ℤ)) i_1) → ((0 : ℤ) < i_3 → Memory.valid_rd t a_4 i_3) → Memory.valid_rd t a_4 i
  := sorry
end parse_x509_Extension_Why3_ide_VCparse_x509_Extension_call_find_ext_by_oid_pre_goal36
