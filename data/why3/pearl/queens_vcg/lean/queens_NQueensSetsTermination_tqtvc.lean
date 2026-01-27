import Why3.Base
import Why3.why3.Ref.Ref
import pearl.queens_vcg.lean.queens.S
open Classical
open Lean4Why3
namespace queens_NQueensSetsTermination_tqtvc
theorem t'vc (a : Finset ℤ) (o1 : Finset ℤ) (b : Finset ℤ) (o2 : Finset ℤ) (c : Finset ℤ) (fact0 : ¬a = ∅) (fact1 : o1 = a \ b) (fact2 : o2 = o1 \ c) : o2 ⊆ (a \ b) \ c ∧ (∀(f : ℤ) (e : Finset ℤ), e ⊆ (a \ b) \ c → ¬e = ∅ → ¬e = ∅ ∧ (∀(o3 : Finset ℤ), o3 = insert (Finset.min'' e) c ∧ (if (Finset.min'' e) ∈ c then Finset.card o3 = Finset.card c else Int.ofNat (Finset.card o3) = Int.ofNat (Finset.card c) + (1 : ℤ)) → (∀(o4 : Finset ℤ), (∀(i : ℤ), (i ∈ o4) = ((0 : ℤ) ≤ i ∧ i + (1 : ℤ) ∈ o3)) → (∀(o5 : Finset ℤ), o5 = insert (Finset.min'' e) b ∧ (if (Finset.min'' e) ∈ b then Finset.card o5 = Finset.card b else Int.ofNat (Finset.card o5) = Int.ofNat (Finset.card b) + (1 : ℤ)) → (∀(o6 : Finset ℤ), (∀(i : ℤ), (i ∈ o6) = ((1 : ℤ) ≤ i ∧ i - (1 : ℤ) ∈ o5)) → (∀(o7 : Finset ℤ), o7 = Finset.erase a (Finset.min'' e) ∧ (if (Finset.min'' e) ∈ a then Int.ofNat (Finset.card o7) = Int.ofNat (Finset.card a) - (1 : ℤ) else Finset.card o7 = Finset.card a) → ((0 : ℤ) ≤ Int.ofNat (Finset.card a) ∧ Finset.card o7 < Finset.card a) ∧ (∀(o8 : ℤ) (o9 : Finset ℤ), o9 = Finset.erase e (Finset.min'' e) ∧ (if (Finset.min'' e) ∈ e then Int.ofNat (Finset.card o9) = Int.ofNat (Finset.card e) - (1 : ℤ) else Finset.card o9 = Finset.card e) → ((0 : ℤ) ≤ Int.ofNat (Finset.card e) ∧ Finset.card o9 < Finset.card e) ∧ o9 ⊆ (a \ b) \ c)))))))
  := sorry
end queens_NQueensSetsTermination_tqtvc
