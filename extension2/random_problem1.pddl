(define (problem PROBLEMA_NIVELBASICO)
    (:domain DOMAIN_EXTENSION2)
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
    )
    (:init
        (quierever Content1)
        (quierever Content4)
        (quierever Content6)
        (predecesor Content1 Content5)
        (predecesor Content2 Content6)
        (predecesor Content4 Content5)
        (paralelo Content1 Content3)
        (paralelo Content1 Content4)
        (paralelo Content2 Content3)
        (paralelo Content2 Content5)
        (paralelo Content3 Content6)
        (paralelo Content4 Content6)
        (paralelo Content5 Content6)
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
        (= (contenidosAgendados Day3) 0)
        (= (orden Day3) 3)
        (= (maxContenidosPorDia)3)
        )
    (:goal
    (forall (?c - contenido)
        (imply
            (quiereVer ?c)
            (exists (?d - dia)
                (agendado ?c ?d))))))
