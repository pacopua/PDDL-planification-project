(define (problem PROBLEMA_EXTENSION1)
    (:domain DOMAIN_EXTENSION1)
    (:objects

        Dune1 Dune2 - contenido

        Chicago_Fire_S08E04 Chicago_Fire_S08E05 - contenido
        Chicago_Med_S05E04 Chicago_Med_S05E05 - contenido
        Chicago_PD_S07E04 Chicago_PD_S07E05 - contenido
        
        viernes sabado domingo - dia
    )
    (:init
        ; Contenido que el usuario quiere ver
        (quiereVer Chicago_PD_S07E05)
        (quiereVer Chicago_PD_S07E04)
        (quiereVer Dune2)

        ; Predecesores de los contenidos
        (predecesor Chicago_Fire_S08E04 Chicago_Fire_S08E05)
        (predecesor Chicago_Med_S05E04 Chicago_Med_S05E05)
        (predecesor Chicago_PD_S07E04 Chicago_PD_S07E05)
        (predecesor Dune1 Dune2)

        ; Contenidos que son paralelos
        (paralelo Chicago_Fire_S08E04 Chicago_Med_S05E04)
        (paralelo Chicago_Fire_S08E04 Chicago_PD_S07E04)
        (paralelo Chicago_Med_S05E04 Chicago_PD_S07E04)
        (paralelo Chicago_Fire_S08E05 Chicago_Med_S05E05)
        (paralelo Chicago_Fire_S08E05 Chicago_PD_S07E05)
        (paralelo Chicago_Med_S05E05 Chicago_PD_S07E05)
        

        (= (contenidosAgendados viernes) 0)
        (= (contenidosAgendados sabado) 0)
        (= (contenidosAgendados domingo) 0)

        (= (orden viernes) 1)
        (= (orden sabado) 2)
        (= (orden domingo) 3)


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