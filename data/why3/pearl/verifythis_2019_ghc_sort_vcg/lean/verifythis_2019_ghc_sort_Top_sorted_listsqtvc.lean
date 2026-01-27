import Why3.Base
import Why3.why3.Ref.Ref
import Why3.exn.Exn
open Classical
open Lean4Why3
namespace verifythis_2019_ghc_sort_Top_sorted_listsqtvc
axiom Trans (x : ℤ) (y : ℤ) (z : ℤ) (fact0 : x < y) (fact1 : y < z) : x < z
inductive sorted : List ℤ -> Prop where
 | Sorted_Nil : sorted ([] : List ℤ)
 | Sorted_One (x : ℤ) : sorted (List.cons x ([] : List ℤ))
 | Sorted_Two (x : ℤ) (y : ℤ) (l : List ℤ) : x < y → sorted (List.cons y l) → sorted (List.cons x (List.cons y l))
axiom sorted_mem (l : List ℤ) (x : ℤ) : ((∀(y : ℤ), y ∈ l → x < y) ∧ sorted l) = sorted (List.cons x l)
axiom sorted_append (l1 : List ℤ) (l2 : List ℤ) : (sorted l1 ∧ sorted l2 ∧ (∀(x : ℤ) (y : ℤ), x ∈ l1 → y ∈ l2 → x < y)) = sorted (l1 ++ l2)
axiom Trans1 (x : ℤ) (y : ℤ) (z : ℤ) (fact0 : x ≤ y) (fact1 : y ≤ z) : x ≤ z
inductive sorted1 : List ℤ -> Prop where
 | Sorted_Nil1 : sorted1 ([] : List ℤ)
 | Sorted_One1 (x : ℤ) : sorted1 (List.cons x ([] : List ℤ))
 | Sorted_Two1 (x : ℤ) (y : ℤ) (l : List ℤ) : x ≤ y → sorted1 (List.cons y l) → sorted1 (List.cons x (List.cons y l))
axiom sorted_mem1 (l : List ℤ) (x : ℤ) : ((∀(y : ℤ), y ∈ l → x ≤ y) ∧ sorted1 l) = sorted1 (List.cons x l)
axiom sorted_append1 (l1 : List ℤ) (l2 : List ℤ) : (sorted1 l1 ∧ sorted1 l2 ∧ (∀(x : ℤ) (y : ℤ), x ∈ l1 → y ∈ l2 → x ≤ y)) = sorted1 (l1 ++ l2)
inductive sorted2 : List ℤ -> Prop where
 | Sorted_Nil2 : sorted2 ([] : List ℤ)
 | Sorted_One2 (x : ℤ) : sorted2 (List.cons x ([] : List ℤ))
 | Sorted_Two2 (y : ℤ) (x : ℤ) (l : List ℤ) : y ≤ x → sorted2 (List.cons y l) → sorted2 (List.cons x (List.cons y l))
axiom sorted_mem2 (l : List ℤ) (x : ℤ) : ((∀(y : ℤ), y ∈ l → y ≤ x) ∧ sorted2 l) = sorted2 (List.cons x l)
axiom sorted_append2 (l1 : List ℤ) (l2 : List ℤ) : (sorted2 l1 ∧ sorted2 l2 ∧ (∀(x : ℤ) (y : ℤ), x ∈ l1 → y ∈ l2 → y ≤ x)) = sorted2 (l1 ++ l2)
noncomputable def compat (s : List ℤ) (t : List ℤ) := match (s, t) with | (List.cons x _, List.cons y _) => x ≤ y | (_, _) => True
axiom rev_append_sorted_incr (s : List ℤ) (t : List ℤ) : sorted1 (List.reverse s ++ t) = (sorted2 s ∧ sorted1 t ∧ compat s t)
axiom rev_append_sorted_decr (s : List ℤ) (t : List ℤ) : sorted2 (List.reverse s ++ t) = (sorted1 s ∧ sorted2 t ∧ compat t s)
noncomputable def eqb (b1 : Bool) (b2 : Bool) := Bool.imp b1 b2 && Bool.imp b2 b1
axiom eqb'spec (b1 : Bool) (b2 : Bool) : (eqb b1 b2 = true) = (b1 = b2)
axiom list_seq : Type
axiom inhabited_axiom_list_seq : Inhabited list_seq
attribute [instance] inhabited_axiom_list_seq
axiom list : list_seq -> List ℤ
axiom seq : list_seq -> List ℤ
axiom list_seq'invariant (self : list_seq) : seq self = List.reverse (list self)
noncomputable def list_seq'eq (a : list_seq) (b : list_seq) := list a = list b ∧ seq a = seq b
axiom list_seq'inj (a : list_seq) (b : list_seq) (fact0 : list_seq'eq a b) : a = b
axiom nil : list_seq
axiom nil'def : list nil = ([] : List ℤ) ∧ seq nil = ([] : List ℤ)
axiom order : List ℤ -> List ℤ
axiom order'def (l : List ℤ) (fact0 : sorted l ∨ sorted2 l) : match l with | ([] : List ℤ) => order l = l | List.cons _ ([] : List ℤ) => order l = l | List.cons h1 (List.cons h2 _) => (if h1 < h2 then order l = l else order l = List.reverse l)
axiom order'spec'0 (l : List ℤ) (fact0 : sorted l ∨ sorted2 l) : sorted1 (order l)
axiom order'spec (l : List ℤ) (fact0 : sorted l ∨ sorted2 l) : List.Perm l (order l)
axiom infix_plpl_closure :  {α : Type} -> [Inhabited α] -> List α -> List α -> List α
axiom infix_plpl_closure_def {α : Type} [Inhabited α] (y : List α) (y1 : List α) : infix_plpl_closure y y1 = y ++ y1
theorem sorted_lists'vc (cutp : list_seq) (s : List ℤ) (fact0 : (0 : ℤ) < Int.ofNat (List.length (list cutp))) (fact1 : ∀(x : ℤ) (y : ℤ), (0 : ℤ) ≤ x ∧ x < y ∧ y < Int.ofNat (List.length (seq cutp)) → (seq cutp)[Int.toNat x]! ≤ (seq cutp)[Int.toNat y]!) (fact2 : ∀(z : ℤ), z ∈ list cutp → (0 : ℤ) ≤ z ∧ z ≤ Int.ofNat (List.length s)) (fact3 : ∀(k : ℤ), (0 : ℤ) ≤ k ∧ k < Int.ofNat (List.length (seq cutp)) - (1 : ℤ) → (let ck : ℤ := (seq cutp)[Int.toNat k]!; let ck1 : ℤ := (seq cutp)[Int.toNat (k + (1 : ℤ))]!; (∀(z1 : ℤ) (z2 : ℤ), ck ≤ z1 ∧ z1 < z2 ∧ z2 < ck1 → s[Int.toNat z1]! < s[Int.toNat z2]!) ∨ (∀(z1 : ℤ) (z2 : ℤ), ck ≤ z1 ∧ z1 < z2 ∧ z2 < ck1 → s[Int.toNat z2]! ≤ s[Int.toNat z1]!))) : let ls : List ℤ := list cutp; let seq1 : List ℤ := seq cutp; (match ls with | ([] : List ℤ) => True | List.cons _ ([] : List ℤ) => True | List.cons h1 (List.cons h2 t) => (((0 : ℤ) ≤ h2 ∧ h2 ≤ Int.ofNat (List.length s)) ∧ ((0 : ℤ) ≤ h1 ∧ h1 ≤ Int.ofNat (List.length s)) ∧ ((∀(z1 : ℤ) (z2 : ℤ), h2 ≤ z1 ∧ z1 < z2 ∧ z2 < h1 → s[Int.toNat z1]! < s[Int.toNat z2]!) ∨ (∀(z1 : ℤ) (z2 : ℤ), h2 ≤ z1 ∧ z1 < z2 ∧ z2 < h1 → s[Int.toNat z2]! ≤ s[Int.toNat z1]!))) ∧ (∀(seqi : List ℤ), (∀(x : ℤ), List.count x seqi = Lean4Why3.map_occ x (getElem! s ∘ Int.toNat) h2 h1) ∧ (∀(x : ℤ), x ∈ seqi → (∃(z : ℤ), (h2 ≤ z ∧ z < h1) ∧ s[Int.toNat z]! = x)) ∧ ((∀(z1 : ℤ) (z2 : ℤ), h2 ≤ z1 ∧ z1 < z2 ∧ z2 < h1 → s[Int.toNat z1]! < s[Int.toNat z2]!) → sorted seqi) ∧ ((∀(z1 : ℤ) (z2 : ℤ), h2 ≤ z1 ∧ z1 < z2 ∧ z2 < h1 → s[Int.toNat z2]! ≤ s[Int.toNat z1]!) → sorted2 seqi) ∧ (sorted seqi ∨ sorted2 seqi) → (let o1 : ℤ := Int.ofNat (List.length seq1) - (1 : ℤ); ((0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ o1 ∧ o1 ≤ Int.ofNat (List.length seq1)) ∧ (let o2 : List ℤ := List.drop (0 : ℕ) (List.take (Int.toNat o1 - (0 : ℕ)) seq1); Int.ofNat (List.length o2) = o1 - (0 : ℤ) ∧ (∀(k : ℤ), (0 : ℤ) ≤ k ∧ k < o1 - (0 : ℤ) → o2[Int.toNat k]! = seq1[Int.toNat ((0 : ℤ) + k)]!) → (let o3 : List ℤ := List.cons h2 t; o2 = List.reverse o3 ∧ (∀(lseq : list_seq), list lseq = o3 ∧ seq lseq = o2 → ((match list cutp with | ([] : List ℤ) => False | List.cons _ f => f = list lseq) ∧ (0 : ℤ) < Int.ofNat (List.length (list lseq)) ∧ (∀(x : ℤ) (y : ℤ), (0 : ℤ) ≤ x ∧ x < y ∧ y < Int.ofNat (List.length (seq lseq)) → (seq lseq)[Int.toNat x]! ≤ (seq lseq)[Int.toNat y]!) ∧ (∀(z : ℤ), z ∈ list lseq → (0 : ℤ) ≤ z ∧ z ≤ Int.ofNat (List.length s)) ∧ (∀(k : ℤ), (0 : ℤ) ≤ k ∧ k < Int.ofNat (List.length (seq lseq)) - (1 : ℤ) → (let ck : ℤ := (seq lseq)[Int.toNat k]!; let ck1 : ℤ := (seq lseq)[Int.toNat (k + (1 : ℤ))]!; (∀(z1 : ℤ) (z2 : ℤ), ck ≤ z1 ∧ z1 < z2 ∧ z2 < ck1 → s[Int.toNat z1]! < s[Int.toNat z2]!) ∨ (∀(z1 : ℤ) (z2 : ℤ), ck ≤ z1 ∧ z1 < z2 ∧ z2 < ck1 → s[Int.toNat z2]! ≤ s[Int.toNat z1]!)))) ∧ (∀(o4 : List (List ℤ)), (∀(l : List ℤ), l ∈ o4 → sorted1 l) ∧ (∀(x : ℤ), List.count x (List.foldr' infix_plpl_closure o4 ([] : List ℤ)) = Lean4Why3.map_occ x (getElem! s ∘ Int.toNat) ((seq lseq)[(0 : ℕ)]!) ((seq lseq)[Int.toNat (Int.ofNat (List.length (seq lseq)) - (1 : ℤ))]!)) → sorted seqi ∨ sorted2 seqi))))))) ∧ (∀(result : List (List ℤ)), (match ls with | ([] : List ℤ) => result = ([] : List (List ℤ)) | List.cons _ ([] : List ℤ) => result = ([] : List (List ℤ)) | List.cons h1 (List.cons h2 t) => (∃(seqi : List ℤ), ((∀(x : ℤ), List.count x seqi = Lean4Why3.map_occ x (getElem! s ∘ Int.toNat) h2 h1) ∧ (∀(x : ℤ), x ∈ seqi → (∃(z : ℤ), (h2 ≤ z ∧ z < h1) ∧ s[Int.toNat z]! = x)) ∧ ((∀(z1 : ℤ) (z2 : ℤ), h2 ≤ z1 ∧ z1 < z2 ∧ z2 < h1 → s[Int.toNat z1]! < s[Int.toNat z2]!) → sorted seqi) ∧ ((∀(z1 : ℤ) (z2 : ℤ), h2 ≤ z1 ∧ z1 < z2 ∧ z2 < h1 → s[Int.toNat z2]! ≤ s[Int.toNat z1]!) → sorted2 seqi) ∧ (sorted seqi ∨ sorted2 seqi)) ∧ (let o1 : ℤ := Int.ofNat (List.length seq1) - (1 : ℤ); let o2 : List ℤ := List.drop (0 : ℕ) (List.take (Int.toNat o1 - (0 : ℕ)) seq1); (Int.ofNat (List.length o2) = o1 - (0 : ℤ) ∧ (∀(k : ℤ), (0 : ℤ) ≤ k ∧ k < o1 - (0 : ℤ) → o2[Int.toNat k]! = seq1[Int.toNat ((0 : ℤ) + k)]!)) ∧ (∃(lseq : list_seq), (list lseq = List.cons h2 t ∧ seq lseq = o2) ∧ (∃(o3 : List (List ℤ)), ((∀(l : List ℤ), l ∈ o3 → sorted1 l) ∧ (∀(x : ℤ), List.count x (List.foldr' infix_plpl_closure o3 ([] : List ℤ)) = Lean4Why3.map_occ x (getElem! s ∘ Int.toNat) ((seq lseq)[(0 : ℕ)]!) ((seq lseq)[Int.toNat (Int.ofNat (List.length (seq lseq)) - (1 : ℤ))]!))) ∧ (let o4 : List ℤ := order seqi; (sorted1 o4 ∧ List.Perm seqi o4) ∧ result = List.cons o4 o3)))))) → (∀(l : List ℤ), l ∈ result → sorted1 l) ∧ (∀(x : ℤ), List.count x (List.foldr' infix_plpl_closure result ([] : List ℤ)) = Lean4Why3.map_occ x (getElem! s ∘ Int.toNat) ((seq cutp)[(0 : ℕ)]!) ((seq cutp)[Int.toNat (Int.ofNat (List.length (seq cutp)) - (1 : ℤ))]!)))
  := sorry
end verifythis_2019_ghc_sort_Top_sorted_listsqtvc
