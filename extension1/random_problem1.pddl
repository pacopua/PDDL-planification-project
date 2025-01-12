(define (problem PROBLEMA_NIVELBASICO)
    (:domain DOMAIN_EXTENSION1)
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
        (quierever Content6)
        (predecesor Content1 Content2)
        (predecesor Content1 Content3)
        (predecesor Content1 Content5)
        (predecesor Content2 Content6)
        (predecesor Content3 Content5)
        (predecesor Content4 Content5)
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
        (= (maxContenidosPorDia) 2)
        )
    (:goal
    (forall (?c - contenido)
        (imply
            (quiereVer ?c)
            (exists (?d - dia)
                (agendado ?c ?d))))))
