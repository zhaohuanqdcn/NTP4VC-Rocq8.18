import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.x509_parser.lib.lean.Compound.Compound
import frama_c.x509_parser.lib.lean.Globals.Globals
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace parse_subjectpubkey_rsa_Why3_ide_VCparse_subjectpubkey_rsa_call_parse_id_len_pre_2_goal1
theorem goal1 (a_1 : Memory.addr) (i_1 : ℤ) (a : Memory.addr) (i_2 : ℤ) (i : ℤ) (t_1 : Memory.addr -> ℤ) (t_2 : Memory.addr -> Memory.addr) (t : ℤ -> ℤ) : let a_2 : Memory.addr := Memory.shift a_1 i_1; let a_3 : Memory.addr := Memory.shift a (1 : ℤ); let a_4 : Memory.addr := Memory.shift a_1 ((1 : ℤ) + i_1); let x : ℤ := i_2 - (1 : ℤ); ¬i = (0 : ℤ) → ¬i_2 = (0 : ℤ) → ¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a_1 → t_1 a_2 = (0 : ℤ) → t_2 a_3 = Memory.shift (Memory.addr.mk (-(8561 : ℤ)) (0 : ℤ)) (0 : ℤ) → ¬a_4 = Memory.addr.mk (0 : ℤ) (0 : ℤ) → (0 : ℤ) < i_2 → (0 : ℤ) ≤ i → i_1 ≤ i → i_2 ≤ i → i_1 + i_2 ≤ i → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → -(2147483647 : ℤ) ≤ i_2 → (2 : ℤ) ≤ i_1 → (2 : ℤ) ≤ i_2 → i_2 ≤ (65536 : ℤ) → Memory.framed t_2 → Memory.linked t → Cint.is_uint16 i → Cint.is_uint16 i_1 → Cint.is_uint16 i_2 → Cint.is_uint16 x → Memory.valid_rd t a_3 (1 : ℤ) → Memory.valid_rd t a_2 (1 : ℤ) → ((0 : ℤ) < i → Memory.valid_rd t (Memory.shift a_1 (0 : ℤ)) i) → Memory.valid_rd t a_4 x
  := sorry
end parse_subjectpubkey_rsa_Why3_ide_VCparse_subjectpubkey_rsa_call_parse_id_len_pre_2_goal1
