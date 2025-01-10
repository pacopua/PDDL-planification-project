(define (problem PROBLEMA_EXTENSION1)
    (:domain DOMAIN_EXTENSION1)
    (:objects
        Thor_Ragnarok Black_Panther - contenido

        Arrow_S06E08 The_Flash_S04E08 Supergirl_S03E08 Legends_of_Tomorrow_S03E08 - contenido
        
        Arrow_S06E06 Arrow_S06E07 - contenido

        viernes sabado domingo - dia
    )
    (:init
        ; Contenido que el usuario quiere ver
        (quiereVer Black_Panther)
        (quiereVer Arrow_S06E08)

        ; Contenido que el usuario ya ha visto
        (haVisto Thor_Ragnarok)
        (haVisto Arrow_S06E06)

        ; Predecesores de los contenidos
        (predecesor Arrow_S06E06 Arrow_S06E07)
        (predecesor Arrow_S06E07 Arrow_S06E08)

        ; Contenidos que son paralelos
        (paralelo Thor_Ragnarok Black_Panther)

        (paralelo Arrow_S06E08 The_Flash_S04E08)
        (paralelo Arrow_S06E08 Supergirl_S03E08)
        (paralelo Arrow_S06E08 Legends_of_Tomorrow_S03E08)
        (paralelo The_Flash_S04E08 Supergirl_S03E08)
        (paralelo The_Flash_S04E08 Legends_of_Tomorrow_S03E08)
        (paralelo Supergirl_S03E08 Legends_of_Tomorrow_S03E08)
        

        (= (contenidosAgendados viernes) 0)
        (= (contenidosAgendados sabado) 0)
        (= (contenidosAgendados domingo) 0)

        (= (orden viernes) 1)
        (= (orden sabado) 2)
        (= (orden domingo) 3)

        (= (maxContenidosPorDia) 2)

    )
    (:goal
        (forall (?c - contenido)
            (imply
                (quiereVer ?c)
                (exists (?d - dia)
                    (agendado ?c ?d)
                )
            )
        )
    )
)