import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.x509_parser.lib.lean.Compound.Compound
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace parse_ext_EKU_Why3_ide_VCparse_ext_EKU_call_find_kp_by_oid_pre_goal5
theorem goal5 (a_1 : Memory.addr) (a : Memory.addr) (a_2 : Memory.addr) (i : ℤ) (i_2 : ℤ) (i_3 : ℤ) (i_1 : ℤ) (t_1 : Memory.addr -> Memory.addr) (t : ℤ -> ℤ) : let x : ℤ := Memory.addr.base a_1; let x_1 : ℤ := Memory.addr.base a; let a_3 : Memory.addr := Memory.shift a_2 (0 : ℤ); ¬i = (0 : ℤ) → ¬i_2 = (0 : ℤ) → ¬i_3 = i_2 → ¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a_1 → ¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a_2 → ¬x = x_1 → (0 : ℤ) < i_1 → (0 : ℤ) ≤ i → i_1 ≤ i → (0 : ℤ) ≤ i_2 → i_3 ≤ i_2 → (0 : ℤ) ≤ i_3 → Memory.region x_1 ≤ (0 : ℤ) → Memory.region x ≤ (0 : ℤ) → -(2147483648 : ℤ) ≤ i_2 → (2 : ℤ) ≤ i_3 → (3 : ℤ) ≤ i_1 → i_2 ≤ (2147483647 : ℤ) → Memory.framed t_1 → Memory.linked t → Cint.is_uint16 i → Cint.is_uint16 i_1 → Cint.is_uint16 i_2 → Cint.is_uint16 i_3 → Memory.valid_rw t a (15 : ℤ) → Cint.is_uint16 (i_2 - i_3) → Memory.valid_rd t a_3 i → ((0 : ℤ) < i_2 → Memory.valid_rd t (Memory.shift a_1 (0 : ℤ)) i_2) → Memory.valid_rd t a_3 i_1
  := sorry
end parse_ext_EKU_Why3_ide_VCparse_ext_EKU_call_find_kp_by_oid_pre_goal5
