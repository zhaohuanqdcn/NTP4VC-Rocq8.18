import Why3.Base
import Why3.hashtbl.Hashtbl
open Classical
open Lean4Why3
namespace hashtbl_test_TestHashtbl_test1qtvc
axiom k1 : Hashtbl.key
axiom k2 : Hashtbl.key
axiom k3 : Hashtbl.key
axiom kdiff : ¬k1 = k2 ∧ ¬k1 = k3 ∧ ¬k2 = k3
theorem test1'vc (h : Hashtbl.t Bool) (fact0 : ∀(k : Hashtbl.key), Hashtbl.mixfix_lbrb h k = ([] : List Bool)) : let o1 : Hashtbl.key := k1; ∀(h1 : Hashtbl.t Bool), Hashtbl.mixfix_lbrb h1 o1 = List.cons true (Hashtbl.mixfix_lbrb h o1) ∧ (∀(k' : Hashtbl.key), ¬k' = o1 → Hashtbl.mixfix_lbrb h1 k' = Hashtbl.mixfix_lbrb h k') → ¬Hashtbl.mixfix_lbrb h1 k1 = ([] : List Bool)
  := sorry
end hashtbl_test_TestHashtbl_test1qtvc
