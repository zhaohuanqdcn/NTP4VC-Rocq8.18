import Why3.Base
open Classical
open Lean4Why3
namespace resizable_array_ResizableArrayImplem_resizeqtvc
axiom rarray : Type -> Type
axiom inhabited_axiom_rarray {α : Type} [Inhabited α] : Inhabited (rarray α)
attribute [instance] inhabited_axiom_rarray
axiom dummy :  {α : Type} -> [Inhabited α] -> rarray α -> α
axiom length :  {α : Type} -> [Inhabited α] -> rarray α -> ℤ
axiom data :  {α : Type} -> [Inhabited α] -> rarray α -> List α
axiom rarray'invariant {α : Type} [Inhabited α] (self : rarray α) : (0 : ℤ) ≤ length self ∧ length self ≤ Int.ofNat (List.length (data self)) ∧ (∀(i : ℤ), length self ≤ i ∧ i < Int.ofNat (List.length (data self)) → (data self)[Int.toNat i]! = dummy self)
noncomputable def rarray'eq {α : Type} [Inhabited α] (a : rarray α) (b : rarray α) := dummy a = dummy b ∧ length a = length b ∧ data a = data b
axiom rarray'inj {α : Type} [Inhabited α] (a : rarray α) (b : rarray α) (fact0 : rarray'eq a b) : a = b
noncomputable def mixfix_lbrb {α : Type} [Inhabited α] (r : rarray α) (i : ℤ) := (data r)[Int.toNat i]!
theorem resize'vc {α : Type} [Inhabited α] (len : ℤ) (r : rarray α) (fact0 : (0 : ℤ) ≤ len) : let n : ℤ := Int.ofNat (List.length (data r)); if n < len then let o1 : ℤ := max len ((2 : ℤ) * n); (0 : ℤ) ≤ o1 ∧ (∀(a : List α), (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < o1 → a[Int.toNat i]! = dummy r) ∧ Int.ofNat (List.length a) = o1 → (let o2 : List α := data r; (((0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ n ∧ (0 : ℤ) + n ≤ Int.ofNat (List.length o2)) ∧ (0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) + n ≤ Int.ofNat (List.length a)) ∧ (∀(a1 : List α), List.length a1 = List.length a → (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < (0 : ℤ) ∨ (0 : ℤ) + n ≤ i ∧ i < Int.ofNat (List.length a1) → a1[Int.toNat i]! = a[Int.toNat i]!) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < (0 : ℤ) + n → a1[Int.toNat i]! = o2[Int.toNat ((0 : ℤ) + i - (0 : ℤ))]!) → (∀(r1 : rarray α), (((0 : ℤ) ≤ len ∧ len ≤ Int.ofNat (List.length a1)) ∧ (∀(i : ℤ), len ≤ i ∧ i < Int.ofNat (List.length a1) → a1[Int.toNat i]! = dummy r)) ∧ (a1 = data r1 ∧ len = length r1 ∧ dummy r = dummy r1 → length r1 = len ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < length r → i < len → mixfix_lbrb r1 i = mixfix_lbrb r i)))))) else let o1 : ℤ := n - len; let o2 : List α := data r; ((0 : ℤ) ≤ len ∧ (0 : ℤ) ≤ o1 ∧ len + o1 ≤ Int.ofNat (List.length o2)) ∧ (∀(r_data : List α), List.length r_data = List.length o2 → List.length r_data = List.length (data r) → (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < len ∨ len + o1 ≤ i ∧ i < Int.ofNat (List.length r_data) → r_data[Int.toNat i]! = o2[Int.toNat i]!) ∧ (∀(i : ℤ), len ≤ i ∧ i < len + o1 → r_data[Int.toNat i]! = dummy r) → (∀(r1 : rarray α), (((0 : ℤ) ≤ len ∧ len ≤ Int.ofNat (List.length r_data)) ∧ (∀(i : ℤ), len ≤ i ∧ i < Int.ofNat (List.length r_data) → r_data[Int.toNat i]! = dummy r)) ∧ (r_data = data r1 ∧ len = length r1 ∧ dummy r = dummy r1 → length r1 = len ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < length r → i < len → mixfix_lbrb r1 i = mixfix_lbrb r i))))
  := sorry
end resizable_array_ResizableArrayImplem_resizeqtvc
