Exercise 2.55: Eva Lu Ator types to the interpreter the ex-
pression

(car ''abracadabra)
To her surprise, the interpreter prints back quote. Explain.


(car ''abracadabra)
=> (car (quote (quote abracadabra)))
=> (car '(quote abracadabra))
=> 'quote
