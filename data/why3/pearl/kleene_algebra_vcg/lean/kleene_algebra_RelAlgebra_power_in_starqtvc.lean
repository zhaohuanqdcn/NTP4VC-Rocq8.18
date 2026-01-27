import Why3.Base
import Why3.map.Const
import Why3.map.MapExt
open Classical
open Lean4Why3
namespace kleene_algebra_RelAlgebra_power_in_starqtvc
axiom a : Type
axiom inhabited_axiom_a : Inhabited a
attribute [instance] inhabited_axiom_a
axiom t : Type
axiom inhabited_axiom_t : Inhabited t
attribute [instance] inhabited_axiom_t
axiom fc : a -> a × a
axiom fc'def (a1 : a) : fc a1 = (a1, a1)
noncomputable def one := fc '' Set.univ
axiom result : a × a -> a
axiom result1 : a -> a × a -> Bool
axiom result'def (p : a × a) : result p = (match p with | (_, a2) => a2)
axiom result'def1 (x : a) (p : a × a) : (result1 x p = true) = (match p with | (a1, _) => a1 = x)
noncomputable def post (s : Set (a × a)) (x : a) := result '' Set.filter s (result1 x)
axiom post'spec (y : a) (s : Set (a × a)) (x : a) : (y ∈ post s x) = ((x, y) ∈ s)
axiom result2 : a × a -> a
axiom result3 : a -> a × a -> Bool
axiom result'def2 (p : a × a) : result2 p = (match p with | (a1, _) => a1)
axiom result'def3 (y : a) (p : a × a) : (result3 y p = true) = (match p with | (_, a2) => a2 = y)
noncomputable def pre (s : Set (a × a)) (y : a) := result2 '' Set.filter s (result3 y)
axiom pre'spec (x : a) (s : Set (a × a)) (y : a) : (x ∈ pre s y) = ((x, y) ∈ s)
axiom infix_pl'spec (x : a × a) (s1 : Set (a × a)) (s2 : Set (a × a)) : (x ∈ s1 ∪ s2) = (x ∈ s1 ∨ x ∈ s2)
axiom result4 : Set (a × a) -> Set (a × a) -> a × a -> Bool
axiom result'def4 (s1 : Set (a × a)) (s2 : Set (a × a)) (p : a × a) : (result4 s1 s2 p = true) = (match p with | (a1, a2) => ¬post s1 a1 ∩ pre s2 a2 = ∅)
noncomputable def infix_as (s1 : Set (a × a)) (s2 : Set (a × a)) := Set.filter Set.univ (result4 s1 s2)
axiom infix_as'spec (a1 : a) (a2 : a) (s1 : Set (a × a)) (s2 : Set (a × a)) : ((a1, a2) ∈ infix_as s1 s2) = (∃(x : a), (a1, x) ∈ s1 ∧ (x, a2) ∈ s2)
axiom Assoc (x : Set (a × a)) (y : Set (a × a)) (z : Set (a × a)) : x ∪ y ∪ z = x ∪ (y ∪ z)
axiom Unit_def_l (x : Set (a × a)) : (∅ : Set (a × a)) ∪ x = x
axiom Unit_def_r (x : Set (a × a)) : x ∪ (∅ : Set (a × a)) = x
axiom Comm (x : Set (a × a)) (y : Set (a × a)) : x ∪ y = y ∪ x
axiom Assoc1 (x : Set (a × a)) (y : Set (a × a)) (z : Set (a × a)) : infix_as (infix_as x y) z = infix_as x (infix_as y z)
axiom Unit_def_l1 (x : Set (a × a)) : infix_as one x = x
axiom Unit_def_r1 (x : Set (a × a)) : infix_as x one = x
axiom Mul_zero_l (x : Set (a × a)) : infix_as (∅ : Set (a × a)) x = (∅ : Set (a × a))
axiom Mul_zero_r (x : Set (a × a)) : infix_as x (∅ : Set (a × a)) = (∅ : Set (a × a))
axiom Mul_distr_l (x : Set (a × a)) (y : Set (a × a)) (z : Set (a × a)) : infix_as x (y ∪ z) = infix_as x y ∪ infix_as x z
axiom Mul_distr_r (y : Set (a × a)) (z : Set (a × a)) (x : Set (a × a)) : infix_as (y ∪ z) x = infix_as y x ∪ infix_as z x
axiom infix_cf : Set (a × a) -> ℤ -> Set (a × a)
axiom infix_cf'def (n : ℤ) (x : Set (a × a)) (fact0 : (0 : ℤ) ≤ n) : if n = (0 : ℤ) then infix_cf x n = one else infix_cf x n = infix_as x (infix_cf x (n - (1 : ℤ)))
axiom Assoc2 (x : Set (a × a)) (y : Set (a × a)) (z : Set (a × a)) : infix_as (infix_as x y) z = infix_as x (infix_as y z)
axiom Unit_def_l2 (x : Set (a × a)) : infix_as one x = x
axiom Unit_def_r2 (x : Set (a × a)) : infix_as x one = x
axiom Power_0 (x : Set (a × a)) : infix_cf x (0 : ℤ) = one
axiom Power_s (n : ℤ) (x : Set (a × a)) (fact0 : (0 : ℤ) ≤ n) : infix_cf x (n + (1 : ℤ)) = infix_as x (infix_cf x n)
axiom Power_s_alt (n : ℤ) (x : Set (a × a)) (fact0 : (0 : ℤ) < n) : infix_cf x n = infix_as x (infix_cf x (n - (1 : ℤ)))
axiom Power_1 (x : Set (a × a)) : infix_cf x (1 : ℤ) = x
axiom Power_sum (n : ℤ) (m : ℤ) (x : Set (a × a)) (fact0 : (0 : ℤ) ≤ n) (fact1 : (0 : ℤ) ≤ m) : infix_cf x (n + m) = infix_as (infix_cf x n) (infix_cf x m)
axiom Power_mult (n : ℤ) (m : ℤ) (x : Set (a × a)) (fact0 : (0 : ℤ) ≤ n) (fact1 : (0 : ℤ) ≤ m) : infix_cf x (n * m) = infix_cf (infix_cf x n) m
axiom Power_comm1 (x : Set (a × a)) (y : Set (a × a)) (n : ℤ) (fact0 : infix_as x y = infix_as y x) (fact1 : (0 : ℤ) ≤ n) : infix_as (infix_cf x n) y = infix_as y (infix_cf x n)
axiom Power_comm2 (x : Set (a × a)) (y : Set (a × a)) (n : ℤ) (fact0 : infix_as x y = infix_as y x) (fact1 : (0 : ℤ) ≤ n) : infix_cf (infix_as x y) n = infix_as (infix_cf x n) (infix_cf y n)
axiom Idem (x : Set (a × a)) : x ∪ x = x
noncomputable def infix_lseq (x : Set (a × a)) (y : Set (a × a)) := x ∪ y = y
inductive in_star : Set (a × a) -> a × a -> Prop where
 | Star_0 (s : Set (a × a)) (x : a) : in_star s (x, x)
 | Star_s (s : Set (a × a)) (x : a) (y : a) (z : a) : in_star s (x, y) → (y, z) ∈ s → in_star s (x, z)
axiom in_star_closure : Set (a × a) -> a × a -> Bool
axiom in_star_closure_def (y : Set (a × a)) (y1 : a × a) : (in_star_closure y y1 = true) = in_star y y1
noncomputable def prefix_ex (s : Set (a × a)) := Set.filter Set.univ (in_star_closure s)
theorem power_in_star'vc (p : a) (p1 : a) (i : ℤ) (s : Set (a × a)) : let p2 : a × a := (p, p1); (0 : ℤ) ≤ i ∧ p2 ∈ infix_cf s i → p2 ∈ prefix_ex s
  := sorry
end kleene_algebra_RelAlgebra_power_in_starqtvc
