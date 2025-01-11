(define (problem PROBLEMA_EXTENSION4)
    (:domain DOMAIN_EXTENSION4)
    (:objects
        Content1 - contenido
        Content2 - contenido
        Content3 - contenido
        Content4 - contenido
        Content5 - contenido
        Content6 - contenido
        Content7 - contenido
        Content8 - contenido
        Content9 - contenido
        Content10 - contenido
        Content11 - contenido
        Content12 - contenido
        Content13 - contenido
        Day1 - dia
        Day2 - dia
        Day3 - dia
    )
    (:init
        (quierever Content1)
        (quierever Content2)
        (quierever Content4)
        (quierever Content5)
        (quierever Content13)
        (predecesor Content1 Content3)
        (predecesor Content1 Content5)
        (predecesor Content1 Content8)
        (predecesor Content1 Content13)
        (predecesor Content2 Content6)
        (predecesor Content3 Content6)
        (predecesor Content3 Content13)
        (predecesor Content4 Content5)
        (predecesor Content6 Content11)
        (predecesor Content7 Content12)
        (predecesor Content10 Content11)
        (predecesor Content10 Content13)
        (paralelo Content2 Content4)
        (paralelo Content2 Content12)
        (paralelo Content3 Content8)
        (paralelo Content4 Content6)
        (paralelo Content4 Content12)
        (paralelo Content8 Content13)
        (paralelo Content11 Content12)
        (not (havisto Content1))
        (not (havisto Content2))
        (not (havisto Content3))
        (not (havisto Content4))
        (not (havisto Content5))
        (not (havisto Content6))
        (not (havisto Content7))
        (not (havisto Content8))
        (not (havisto Content9))
        (not (havisto Content10))
        (not (havisto Content11))
        (not (havisto Content12))
        (not (havisto Content13))
        (= (minutosAgendados Day1) 0)
        (= (orden Day1) 1)
        (= (minutosAgendados Day2) 0)
        (= (orden Day2) 2)
        (= (minutosAgendados Day3) 0)
        (= (orden Day3) 3)
        (= (duracion Content1) 41)
        (= (duracion Content2) 27)
        (= (duracion Content3) 40)
        (= (duracion Content4) 37)
        (= (duracion Content5) 24)
        (= (duracion Content6) 23)
        (= (duracion Content7) 41)
        (= (duracion Content8) 41)
        (= (duracion Content9) 32)
        (= (duracion Content10) 32)
        (= (duracion Content11) 31)
        (= (duracion Content12) 48)
        (= (duracion Content13) 22)
    )
    (:goal
    (forall (?c - contenido)
        (imply
            (quiereVer ?c)
            (exists (?d - dia)
                (agendado ?c ?d))))))
