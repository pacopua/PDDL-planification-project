(define (problem PROBLEMA_EXTENSION3)
    (:domain DOMAIN_EXTENSION3)
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
        Day1 - dia
        Day2 - dia
        Day3 - dia
    )
    (:init
        (quierever Content1)
        (quierever Content6)
        (quierever Content7)
        (quierever Content9)
        (predecesor Content3 Content7)
        (predecesor Content7 Content9)
        (paralelo Content1 Content6)
        (paralelo Content5 Content6)
        (paralelo Content5 Content7)
        (not (havisto Content1))
        (not (havisto Content2))
        (not (havisto Content3))
        (not (havisto Content4))
        (not (havisto Content5))
        (not (havisto Content6))
        (not (havisto Content7))
        (not (havisto Content8))
        (not (havisto Content9))
        (= (contenidosAgendados Day1) 0)
        (= (orden Day1) 1)
        (= (contenidosAgendados Day2) 0)
        (= (orden Day2) 2)
        (= (contenidosAgendados Day3) 0)
        (= (orden Day3) 3)
    )
    (:goal
    (forall (?c - contenido)
        (imply
            (quiereVer ?c)
            (exists (?d - dia)
                (agendado ?c ?d))))))
