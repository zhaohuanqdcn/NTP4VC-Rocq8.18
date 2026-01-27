import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.x509_parser.lib.lean.Compound.Compound
import frama_c.x509_parser.lib.lean.Globals.Globals
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace find_kp_by_oid_Why3_ide_VCfind_kp_by_oid_call_bufs_differ_pre_goal0
theorem goal0 (i : ℤ) (t_1 : Memory.addr -> ℤ) (a_1 : Memory.addr) (t_2 : Memory.addr -> Memory.addr) (t : ℤ -> ℤ) : let a_2 : Memory.addr := Compound.shift___anonstruct__kp_oid_13 (Memory.addr.mk (-(8645 : ℤ)) (0 : ℤ)) i; let a_3 : Memory.addr := Memory.shift a_2 (1 : ℤ); let x : ℤ := t_1 a_3; let a_4 : Memory.addr := Memory.shift a_1 (0 : ℤ); ¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a_1 → ¬x = (0 : ℤ) → (0 : ℤ) ≤ i → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → (0 : ℤ) ≤ x → i ≤ (6 : ℤ) → i ≤ (7 : ℤ) → Memory.framed t_2 → Memory.linked t → Cint.is_uint8 i → Cint.is_uint8 x → Cint.is_uint16 x → Memory.valid_rd t (Memory.shift a_2 (0 : ℤ)) (1 : ℤ) → Memory.valid_rd t a_3 (1 : ℤ) → ((0 : ℤ) < x → Memory.valid_rd t a_4 x) → Memory.valid_rd t a_4 x
  := sorry
end find_kp_by_oid_Why3_ide_VCfind_kp_by_oid_call_bufs_differ_pre_goal0
