(define (problem PROBLEMA_EXTENSION3)
    (:domain DOMAIN_EXTENSION3)
    (:objects
        Content1 - contenido
        Content2 - contenido
        Content3 - contenido
        Content4 - contenido
        Content5 - contenido
        Content6 - contenido
        Day1 - dia
        Day2 - dia
    )
    (:init
        (quierever Content1)
        (quierever Content2)
        (quierever Content3)
        (quierever Content4)
        (quierever Content5)
        (quierever Content6)
        (predecesor Content1 Content2)
        (predecesor Content4 Content6)
        (predecesor Content3 Content5)
        (paralelo Content3 Content4)
        (not (havisto Content1))
        (not (havisto Content2))
        (not (havisto Content3))
        (not (havisto Content4))
        (not (havisto Content5))
        (not (havisto Content6))
        (= (contenidosAgendados Day1) 0)
        (= (orden Day1) 1)
        (= (contenidosAgendados Day2) 0)
        (= (orden Day2) 2)
    )
    (:goal
    (forall (?c - contenido)
        (imply
            (quiereVer ?c)
            (exists (?d - dia)
                (agendado ?c ?d))))))
