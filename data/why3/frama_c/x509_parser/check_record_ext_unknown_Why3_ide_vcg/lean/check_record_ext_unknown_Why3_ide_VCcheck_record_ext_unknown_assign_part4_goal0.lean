import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.x509_parser.lib.lean.Compound.Compound
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace check_record_ext_unknown_Why3_ide_VCcheck_record_ext_unknown_assign_part4_goal0
theorem goal0 (a : Memory.addr) (i : ℤ) (t_1 : Memory.addr -> Memory.addr) (t_2 : Memory.addr -> Memory.addr) (a_1 : Memory.addr) (t : ℤ -> ℤ) : let a_2 : Memory.addr := Memory.shift a (0 : ℤ); let a_3 : Memory.addr := Memory.shift a i; let a_4 : Memory.addr := Memory.havoc t_1 t_2 a_2 (29 : ℤ) a_3; ¬a_4 = a_1 → a_4 = Memory.addr.mk (0 : ℤ) (0 : ℤ) → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → i ≤ (28 : ℤ) → i ≤ (29 : ℤ) → Memory.framed t_2 → Memory.linked t → Cint.is_uint16 i → Memory.valid_rd t a_3 (1 : ℤ) → Memory.valid_rw t a_2 (29 : ℤ) → Memory.valid_rw t a_3 (1 : ℤ) → ¬Memory.invalid t a_3 (1 : ℤ) → (0 : ℤ) ≤ i
  := sorry
end check_record_ext_unknown_Why3_ide_VCcheck_record_ext_unknown_assign_part4_goal0
