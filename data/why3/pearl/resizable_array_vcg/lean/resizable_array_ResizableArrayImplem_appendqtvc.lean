import Why3.Base
open Classical
open Lean4Why3
namespace resizable_array_ResizableArrayImplem_appendqtvc
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
theorem append'vc {α : Type} [Inhabited α] (r1 : rarray α) (r2 : rarray α) : let n1 : ℤ := length r1; let o1 : ℤ := length r1 + length r2; (0 : ℤ) ≤ o1 ∧ (∀(r11 : rarray α), dummy r1 = dummy r11 → length r11 = o1 ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < length r1 → i < o1 → mixfix_lbrb r11 i = mixfix_lbrb r1 i) → (let o2 : ℤ := length r2; let o3 : List α := data r11; let o4 : List α := data r2; (((0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ o2 ∧ (0 : ℤ) + o2 ≤ Int.ofNat (List.length o4)) ∧ (0 : ℤ) ≤ n1 ∧ n1 + o2 ≤ Int.ofNat (List.length o3)) ∧ (∀(r12 : rarray α) (r1_data : List α), List.length r1_data = List.length o3 → List.length r1_data = List.length (data r11) → (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < n1 ∨ n1 + o2 ≤ i ∧ i < Int.ofNat (List.length r1_data) → r1_data[Int.toNat i]! = o3[Int.toNat i]!) ∧ (∀(i : ℤ), n1 ≤ i ∧ i < n1 + o2 → r1_data[Int.toNat i]! = o4[Int.toNat ((0 : ℤ) + i - n1)]!) → (((0 : ℤ) ≤ length r11 ∧ length r11 ≤ Int.ofNat (List.length r1_data)) ∧ (∀(i : ℤ), length r11 ≤ i ∧ i < Int.ofNat (List.length r1_data) → r1_data[Int.toNat i]! = dummy r11)) ∧ (r1_data = data r12 ∧ length r11 = length r12 ∧ dummy r11 = dummy r12 → length r12 = length r1 + length r2 ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < length r12 → (i < length r1 → mixfix_lbrb r12 i = mixfix_lbrb r1 i) ∧ (length r1 ≤ i → mixfix_lbrb r12 i = mixfix_lbrb r2 (i - length r1)))))))
  := sorry
end resizable_array_ResizableArrayImplem_appendqtvc
