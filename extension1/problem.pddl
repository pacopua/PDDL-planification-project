(define (problem PROBLEMA_EXTENSION1)
    (:domain DOMAIN_EXTENSION1)
    (:objects

        Sonic1 Sonic2 Sonic3 - contenido

        Los_juegos_del_hambre Los_juegos_del_hambre_En_llamas Los_juegos_del_hambre_Sinsajo_parte_1 Los_juegos_del_hambre_Sinsajo_parte_2 - contenido

        Sherlock_A_study_in_pink Sherlock_The_blind_banker Sherlock_The_great_game - contenido
        Sherlock_The_abominable_bridge - contenido

        lunes martes miercoles jueves - dia
    )
    (:init
        ; Peliculas que el usuario quiere ver
        (quiereVer Sonic3)
        (quiereVer Los_juegos_del_hambre_Sinsajo_parte_1)
        (quiereVer Los_juegos_del_hambre_Sinsajo_parte_2)
        (quiereVer Sherlock_The_abominable_bridge)

        ; Peliculas que el usuario ya ha visto
        (haVisto Sonic1)
        (haVisto Los_juegos_del_hambre)
        (haVisto Los_juegos_del_hambre_En_llamas)

        ; Predecesores de las peliculas
        (predecesor Sonic1 Sonic2)
        (predecesor Sonic2 Sonic3)

        (predecesor Los_juegos_del_hambre Los_juegos_del_hambre_En_llamas)
        (predecesor Los_juegos_del_hambre_En_llamas Los_juegos_del_hambre_Sinsajo_parte_1)
        (predecesor Los_juegos_del_hambre_Sinsajo_parte_1 Los_juegos_del_hambre_Sinsajo_parte_2)

        (predecesor Sherlock_A_study_in_pink Sherlock_The_blind_banker)
        (predecesor Sherlock_The_blind_banker Sherlock_The_great_game)

        (predecesor Sherlock_A_study_in_pink Sherlock_The_abominable_bridge)
        (predecesor Sherlock_The_blind_banker Sherlock_The_abominable_bridge)
        (predecesor Sherlock_The_great_game Sherlock_The_abominable_bridge)
        

        (= (contenidosAgendados lunes) 0)
        (= (contenidosAgendados martes) 0)
        (= (contenidosAgendados miercoles) 0)
        (= (contenidosAgendados jueves) 0)

        (= (orden lunes) 1)
        (= (orden martes) 2)
        (= (orden miercoles) 3)
        (= (orden jueves) 4)

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