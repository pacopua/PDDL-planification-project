(define (problem PROBLEMA_EXTENSION4)
    (:domain DOMAIN_EXTENSION4)
    (:objects

        Infinity_War Antman_and_the_wasp - contenido

        Rogue_One_A_Star_Wars_Story Star_Wars_Episode_IV - contenido 
        
        Breaking_Bad_S01E01 Breaking_Bad_S01E02 Breaking_Bad_S01E03 Breaking_Bad_S01E04 Breaking_Bad_S01E05 - contenido

        viernes sabado domingo lunes - dia
    )
    (:init
        ; Duracion de los contenidos
        (= (duracion Infinity_War) 149)
        (= (duracion Antman_and_the_wasp) 140)
        (= (duracion Rogue_One_A_Star_Wars_Story) 147)
        (= (duracion Star_Wars_Episode_IV) 121)
        (= (duracion Breaking_Bad_S01E01) 54)
        (= (duracion Breaking_Bad_S01E02) 62)
        (= (duracion Breaking_Bad_S01E03) 53)
        (= (duracion Breaking_Bad_S01E04) 55)
        (= (duracion Breaking_Bad_S01E05) 42)

        ; Contenido que el usuario quiere ver
        (quiereVer Infinity_War)
        (quiereVer Rogue_One_A_Star_Wars_Story)
        (quiereVer Breaking_Bad_S01E05)

        ; Contenido que el usuario ya ha visto
        (haVisto Breaking_Bad_S01E01)

        ; Predecesores de los contenidos
        (predecesor Breaking_Bad_S01E01 Breaking_Bad_S01E02)
        (predecesor Breaking_Bad_S01E02 Breaking_Bad_S01E03)
        (predecesor Breaking_Bad_S01E03 Breaking_Bad_S01E04)
        (predecesor Breaking_Bad_S01E04 Breaking_Bad_S01E05)

        ; Contenidos que son paralelos
        (paralelo Infinity_War Antman_and_the_wasp)
        (paralelo Rogue_One_A_Star_Wars_Story Star_Wars_Episode_IV)
        

        (= (minutosAgendados viernes) 0)
        (= (minutosAgendados sabado) 0)
        (= (minutosAgendados domingo) 0)
        (= (minutosAgendados lunes) 0)

        (= (orden viernes) 1)
        (= (orden sabado) 2)
        (= (orden domingo) 3)
        (= (orden lunes) 4)

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