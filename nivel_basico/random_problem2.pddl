(define (problem PROBLEMA_NIVELBASICO)
    (:domain DOMAIN_NIVELBASICO)
    (:objects
        Content1 - contenido
        Content2 - contenido
        Content3 - contenido
        Content4 - contenido
        Content5 - contenido
        Content6 - contenido
        Content7 - contenido
        Day1 - dia
        Day2 - dia
        Day3 - dia
    )
    (:init
        (quierever Content1)
        (quierever Content2)
        (quierever Content5)
        (quierever Content7)
        (predecesor Content2 Content3)
        (predecesor Content4 Content5)
        (predecesor Content6 Content7)
        (not (havisto Content1))
        (not (havisto Content2))
        (not (havisto Content3))
        (not (havisto Content4))
        (not (havisto Content5))
        (not (havisto Content6))
        (not (havisto Content7))
        (= (contenidosAgendados Day1) 0)
        (= (orden Day1) 1)
        (= (contenidosAgendados Day2) 0)
        (= (orden Day2) 2)
        (= (contenidosAgendados Day3) 0)
        (= (orden Day3) 3)
        (= (maxContenidosPorDia) 3)
        )
    (:goal
    (forall (?c - contenido)
        (imply
            (quiereVer ?c)
            (exists (?d - dia)
                (agendado ?c ?d))))))
