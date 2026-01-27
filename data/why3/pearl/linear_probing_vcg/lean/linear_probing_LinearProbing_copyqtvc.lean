import Why3.Base
import Why3.why3.Ref.Ref
import Why3.int.NumOf
import Why3.map.Const
open Classical
open Lean4Why3
namespace linear_probing_LinearProbing_copyqtvc
axiom key : Type
axiom inhabited_axiom_key : Inhabited key
attribute [instance] inhabited_axiom_key
axiom keym : Type
axiom inhabited_axiom_keym : Inhabited keym
attribute [instance] inhabited_axiom_keym
axiom keym1 : key -> keym
axiom eq : key -> key -> Prop
axiom eq'spec (x : key) (y : key) : eq x y = (keym1 x = keym1 y)
noncomputable def neq (x : key) (y : key) := ¬eq x y
axiom neq'spec (x : key) (y : key) : neq x y = (¬keym1 x = keym1 y)
axiom hash : key -> ℤ
axiom hash_nonneg (k : key) : (0 : ℤ) ≤ hash k
axiom hash_eq (x : key) (y : key) (fact0 : eq x y) : hash x = hash y
axiom dummy : key
axiom bucket : key -> ℤ -> ℤ
axiom bucket'def (n : ℤ) (k : key) (fact0 : (0 : ℤ) < n) : bucket k n = Int.tmod (hash k) n
axiom bucket'spec (n : ℤ) (k : key) (fact0 : (0 : ℤ) < n) : (0 : ℤ) ≤ bucket k n ∧ bucket k n < n
noncomputable def between (l : ℤ) (j : ℤ) (r : ℤ) := l ≤ j ∧ j < r ∨ r < l ∧ l ≤ j ∨ j < r ∧ r < l
axiom fc : List key -> ℤ -> Bool
axiom fc'def (a : List key) (i : ℤ) : (fc a i = true) = eq (a[Int.toNat i]!) dummy
noncomputable def numof (a : List key) (l : ℤ) (u : ℤ) := NumOf.numof (fc a) l u
noncomputable def valid (data : List key) (view : keym -> Bool) (loc : keym -> ℤ) := ¬view (keym1 dummy) = true ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length data) → (let x : key := data[Int.toNat i]!; neq x dummy → view (keym1 x) = true ∧ loc (keym1 x) = i)) ∧ (let n : ℤ := Int.ofNat (List.length data); ∀(x : key), view (keym1 x) = true → (let i : ℤ := loc (keym1 x); ((0 : ℤ) ≤ i ∧ i < n) ∧ eq (data[Int.toNat i]!) x ∧ (∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < n → between (bucket x n) j i → neq (data[Int.toNat j]!) x ∧ neq (data[Int.toNat j]!) dummy)))
axiom t : Type
axiom inhabited_axiom_t : Inhabited t
attribute [instance] inhabited_axiom_t
axiom size : t -> ℤ
axiom data : t -> List key
axiom view : t -> keym -> Bool
axiom loc : t -> keym -> ℤ
axiom t'invariant (self : t) : (0 : ℤ) ≤ size self ∧ size self < Int.ofNat (List.length (data self)) ∧ size self + numof (data self) (0 : ℤ) (Int.ofNat (List.length (data self))) = Int.ofNat (List.length (data self)) ∧ valid (data self) (view self) (loc self)
noncomputable def t'eq (a : t) (b : t) := size a = size b ∧ data a = data b ∧ view a = view b ∧ loc a = loc b
axiom t'inj (a : t) (b : t) (fact0 : t'eq a b) : a = b
noncomputable def next (n : ℤ) (i : ℤ) := let i1 : ℤ := i + (1 : ℤ); if i1 = n then (0 : ℤ) else i1
theorem copy'vc (h : t) : let o1 : keym -> ℤ := loc h; let o2 : keym -> Bool := view h; let o3 : List key := data h; ∀(o4 : List key), List.length o4 = List.length o3 ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length o4) → o4[Int.toNat i]! = o3[Int.toNat i]!) → (let o5 : ℤ := size h; (((0 : ℤ) ≤ o5 ∧ o5 < Int.ofNat (List.length o4)) ∧ (let n : ℤ := Int.ofNat (List.length o4); o5 + numof o4 (0 : ℤ) n = n) ∧ valid o4 o2 o1) ∧ (∀(result : t), size result = o5 ∧ data result = o4 ∧ view result = o2 ∧ loc result = o1 → view result = view h))
  := sorry
end linear_probing_LinearProbing_copyqtvc
