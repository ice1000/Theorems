module Lists.Reverse where

open import Data.List hiding (reverse)
open import Data.Nat
open import Agda.Builtin.Equality

------------------------------------------------------------------------
-- definitions

reverse : ∀ {n} {A : Set n} → List A → List A
reverse [] = []
reverse (x ∷ xs) = reverse xs ∷ʳ x

------------------------------------------------------------------------
-- internal stuffs

private

  -- rev$v:a=a:rev$v : ∀ {n m} {A : Set n} (a : A) (v : List A m) →
  --                 rev (v ∷ʳ a) ≡ a ∷ rev v
  -- rev$v:a=a:rev$v _ [] = refl
  -- rev$v:a=a:rev$v a (_ ∷ xs) with rev (xs ∷ʳ a) | rev$v:a=a:rev$v a xs
  -- ...                            | .(a ∷ rev xs) | refl = refl

  rev$v:a=a:rev$v : ∀ {n} {A : Set n} (a : A) (v : List A) →
                  reverse (v ∷ʳ a) ≡ a ∷ reverse v
  rev$v:a=a:rev$v _ [] = refl
  rev$v:a=a:rev$v a (_ ∷ xs)
    rewrite rev$v:a=a:rev$v a xs
            = refl

  rev∘rev=id : ∀ {n} {A : Set n} (v : List A) → reverse (reverse v) ≡ v
  rev∘rev=id [] = refl
  rev∘rev=id (x ∷ xs)
    rewrite rev$v:a=a:rev$v x (reverse xs)
          | rev∘rev=id xs
            = refl

------------------------------------------------------------------------
-- public aliases

list-rev-rev : ∀ {n} {A : Set n} (v : List A) → reverse (reverse v) ≡ v
list-rev-rev = rev∘rev=id
