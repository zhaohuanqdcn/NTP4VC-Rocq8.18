import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.x509_parser.lib.lean.Compound.Compound
import Why3.Cint.Cint
import frama_c.x509_parser.lib.lean.Globals.Globals
open Classical
open Lean4Why3
namespace parse_x509_signatureValue_Why3_ide_VCparse_x509_signatureValue_stmt_calls_parse_sig_ecdsa_pars____goal0
theorem goal0 (a : Memory.addr) (t_1 : Memory.addr -> Memory.addr) (i : ℤ) (a_2 : Memory.addr) (a_1 : Memory.addr) (t : ℤ -> ℤ) : let a_3 : Memory.addr := Memory.shift a (5 : ℤ); let a_4 : Memory.addr := t_1 a_3; ¬i = (0 : ℤ) → ¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a → ¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a_2 → ¬a_4 = Memory.addr.mk (0 : ℤ) (0 : ℤ) → (0 : ℤ) ≤ i → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_2) ≤ (0 : ℤ) → Memory.framed t_1 → Memory.linked t → Cint.is_uint16 i → Memory.valid_rd t a (8 : ℤ) → Memory.valid_rw t a_1 (1 : ℤ) → Memory.valid_rd t a_3 (1 : ℤ) → ((0 : ℤ) < i → Memory.valid_rd t (Memory.shift a_2 (0 : ℤ)) i) → a_4 = Memory.addr.mk (8418 : ℤ) (0 : ℤ) ∨ a_4 = Memory.addr.mk (8423 : ℤ) (0 : ℤ)
  := sorry
end parse_x509_signatureValue_Why3_ide_VCparse_x509_signatureValue_stmt_calls_parse_sig_ecdsa_pars____goal0
