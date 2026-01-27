import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.x509_parser.lib.lean.Compound.Compound
import frama_c.x509_parser.lib.lean.Globals.Globals
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace parse_subjectpubkey_rsa_Why3_ide_VCparse_subjectpubkey_rsa_call_parse_integer_pre_goal2
theorem goal2 (a_1 : Memory.addr) (i_3 : ℤ) (a : Memory.addr) (i_4 : ℤ) (i : ℤ) (i_2 : ℤ) (t_1 : Memory.addr -> ℤ) (t_2 : Memory.addr -> Memory.addr) (i_1 : ℤ) (t : ℤ -> ℤ) : let a_2 : Memory.addr := Memory.shift a_1 i_3; let a_3 : Memory.addr := Memory.shift a (1 : ℤ); let a_4 : Memory.addr := Memory.shift a_1 ((1 : ℤ) + i_3); let a_5 : Memory.addr := Memory.shift a_1 ((1 : ℤ) + i_3 + i_4); ¬i = -(1 : ℤ) → ¬i = (0 : ℤ) → ¬i_2 = (0 : ℤ) → ¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a_1 → t_1 a_2 = (0 : ℤ) → t_2 a_3 = Memory.shift (Memory.addr.mk (-(8561 : ℤ)) (0 : ℤ)) (0 : ℤ) → ¬a_4 = Memory.addr.mk (0 : ℤ) (0 : ℤ) → ¬a_5 = Memory.addr.mk (0 : ℤ) (0 : ℤ) → (0 : ℤ) < i_1 → (0 : ℤ) ≤ i → i_1 ≤ i → i < i_2 → i_4 ≤ i → (0 : ℤ) ≤ i_2 → i_3 ≤ i_2 → i_1 + i_4 ≤ i → i + i_3 < i_2 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → -(2147483648 : ℤ) ≤ i → (2 : ℤ) ≤ i_3 → (2 : ℤ) ≤ i_4 → i ≤ (65535 : ℤ) → Memory.framed t_2 → Memory.linked t → Cint.is_uint16 i → Cint.is_uint16 i_1 → Cint.is_uint16 i_2 → Cint.is_uint16 i_3 → Cint.is_uint16 i_4 → Cint.is_uint16 ((1 : ℤ) + i) → Memory.valid_rd t a_3 (1 : ℤ) → Memory.valid_rd t a_2 (1 : ℤ) → ((0 : ℤ) < i_2 → Memory.valid_rd t (Memory.shift a_1 (0 : ℤ)) i_2) → ((0 : ℤ) < i → Memory.valid_rd t a_4 i) → Memory.valid_rd t a_5 i_1
  := sorry
end parse_subjectpubkey_rsa_Why3_ide_VCparse_subjectpubkey_rsa_call_parse_integer_pre_goal2
