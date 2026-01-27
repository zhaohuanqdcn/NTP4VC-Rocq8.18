import Why3.Base
import Why3.int.Fibonacci
open Classical
open Lean4Why3
namespace fibonacci_FibRecNoGhost_fib_auxqtvc
theorem fib_aux'vc (k : ℤ) (a : ℤ) (b : ℤ) (fact0 : (0 : ℤ) ≤ k) (fact1 : ∃(n : ℤ), (0 : ℤ) ≤ n ∧ a = Fibonacci.fib n ∧ b = Fibonacci.fib (n + (1 : ℤ))) : (¬k = (0 : ℤ) → (let o1 : ℤ := k - (1 : ℤ); ((0 : ℤ) ≤ k ∧ o1 < k) ∧ (0 : ℤ) ≤ o1 ∧ (∃(n : ℤ), (0 : ℤ) ≤ n ∧ b = Fibonacci.fib n ∧ a + b = Fibonacci.fib (n + (1 : ℤ))))) ∧ (∀(result : ℤ), (if k = (0 : ℤ) then result = a else ∀(n : ℤ), (0 : ℤ) ≤ n ∧ b = Fibonacci.fib n ∧ a + b = Fibonacci.fib (n + (1 : ℤ)) → result = Fibonacci.fib (n + (k - (1 : ℤ)))) → (∀(n : ℤ), (0 : ℤ) ≤ n ∧ a = Fibonacci.fib n ∧ b = Fibonacci.fib (n + (1 : ℤ)) → result = Fibonacci.fib (n + k)))
  := sorry
end fibonacci_FibRecNoGhost_fib_auxqtvc
