import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace RelaxedPrefix
axiom char : Type
axiom inhabited_axiom_char : Inhabited char
attribute [instance] inhabited_axiom_char
noncomputable def eq_array (a1 : List char) (ofs1 : ℤ) (a2 : List char) (ofs2 : ℤ) (len : ℤ) := (0 : ℤ) ≤ len ∧ (0 : ℤ) ≤ ofs1 ∧ (0 : ℤ) ≤ ofs2 ∧ ofs1 + len ≤ Int.ofNat (List.length a1) ∧ ofs2 + len ≤ Int.ofNat (List.length a2) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < len → a1[Int.toNat (ofs1 + i)]! = a2[Int.toNat (ofs2 + i)]!)
noncomputable def is_relaxed_prefix (pat : List char) (a : List char) := let n : ℤ := Int.ofNat (List.length pat); eq_array pat (0 : ℤ) a (0 : ℤ) n ∨ (∃(i : ℤ), ((0 : ℤ) ≤ i ∧ i < n) ∧ eq_array pat (0 : ℤ) a (0 : ℤ) i ∧ eq_array pat (i + (1 : ℤ)) a i (n - i - (1 : ℤ)))
end RelaxedPrefix
