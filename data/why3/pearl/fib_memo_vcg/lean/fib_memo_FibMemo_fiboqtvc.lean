import Why3.Base
import Why3.why3.Ref.Ref
import Why3.int.Fibonacci
open Classical
open Lean4Why3
namespace fib_memo_FibMemo_fiboqtvc
axiom table : Type
axiom inhabited_axiom_table : Inhabited table
attribute [instance] inhabited_axiom_table
noncomputable def inv (t : ℤ -> Option ℤ) := ∀(x : ℤ) (y : ℤ), t x = Option.some y → y = Fibonacci.fib x
theorem fibo'vc (n : ℤ) (table1 : ℤ -> Option ℤ) (fact0 : (0 : ℤ) ≤ n) (fact1 : inv table1) : if n ≤ (1 : ℤ) then n = Fibonacci.fib n ∧ inv table1 else let o1 : ℤ := n - (2 : ℤ); (((0 : ℤ) ≤ (2 : ℤ) * n ∧ (2 : ℤ) * o1 + (1 : ℤ) < (2 : ℤ) * n) ∧ (0 : ℤ) ≤ o1 ∧ inv table1) ∧ (∀(table2 : ℤ -> Option ℤ), inv table2 → (let o2 : ℤ := n - (1 : ℤ); (((0 : ℤ) ≤ (2 : ℤ) * n ∧ (2 : ℤ) * o2 + (1 : ℤ) < (2 : ℤ) * n) ∧ (0 : ℤ) ≤ o2 ∧ inv table2) ∧ (∀(table3 : ℤ -> Option ℤ), inv table3 → Fibonacci.fib o2 + Fibonacci.fib o1 = Fibonacci.fib n ∧ inv table3)))
  := sorry
end fib_memo_FibMemo_fiboqtvc
