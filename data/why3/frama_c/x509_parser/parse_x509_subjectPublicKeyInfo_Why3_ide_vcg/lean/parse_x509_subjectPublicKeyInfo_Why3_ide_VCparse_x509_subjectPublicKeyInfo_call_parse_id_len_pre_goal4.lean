import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.x509_parser.lib.lean.Compound.Compound
import frama_c.x509_parser.lib.lean.Globals.Globals
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace parse_x509_subjectPublicKeyInfo_Why3_ide_VCparse_x509_subjectPublicKeyInfo_call_parse_id_len_pre_goal4
theorem goal4 (a_1 : Memory.addr) (a : Memory.addr) (i : ℤ) (t_1 : Memory.addr -> Memory.addr) (t : ℤ -> ℤ) : let x : ℤ := Memory.addr.base a_1; let x_1 : ℤ := Memory.addr.base a; let a_2 : Memory.addr := Memory.shift a_1 (0 : ℤ); ¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a_1 → ¬x = x_1 → (0 : ℤ) < i → Memory.region x_1 ≤ (0 : ℤ) → Memory.region x ≤ (0 : ℤ) → Memory.framed t_1 → Memory.linked t → Cint.is_uint16 i → Memory.valid_rw t a (1 : ℤ) → Memory.valid_rd t a_2 i → Memory.valid_rd (Function.update t (7106 : ℤ) (4 : ℤ)) a_2 i
  := sorry
end parse_x509_subjectPublicKeyInfo_Why3_ide_VCparse_x509_subjectPublicKeyInfo_call_parse_id_len_pre_goal4
