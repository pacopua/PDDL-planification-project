(define (problem PROBLEMA_EXTENSION4)
    (:domain DOMAIN_EXTENSION4)
    (:objects
        Content1 - contenido
        Content2 - contenido
        Content3 - contenido
        Content4 - contenido
        Content5 - contenido
        Content6 - contenido
        Day1 - dia
        Day2 - dia
        Day3 - dia
        Day4 - dia
    )
    (:init
        (quierever Content4)
        (quierever Content6)
        (predecesor Content1 Content6)
        (predecesor Content3 Content4)
        (predecesor Content4 Content6)
        (paralelo Content4 Content5)
        (not (havisto Content1))
        (not (havisto Content2))
        (not (havisto Content3))
        (not (havisto Content4))
        (not (havisto Content5))
        (not (havisto Content6))
        (= (minutosAgendados Day1) 0)
        (= (orden Day1) 1)
        (= (minutosAgendados Day2) 0)
        (= (orden Day2) 2)
        (= (minutosAgendados Day3) 0)
        (= (orden Day3) 3)
        (= (minutosAgendados Day4) 0)
        (= (orden Day4) 4)
        (= (duracion Content1) 80)
        (= (duracion Content2) 115)
        (= (duracion Content3) 90)
        (= (duracion Content4) 125)
        (= (duracion Content5) 140)
        (= (duracion Content6) 121)
    )
    (:goal
    (forall (?c - contenido)
        (imply
            (quiereVer ?c)
            (exists (?d - dia)
                (agendado ?c ?d))))))
