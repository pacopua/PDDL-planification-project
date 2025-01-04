(define (problem PROBLEMA_NIVELBASICO)
    (:domain DOMAIN_NIVELBASICO)
    (:objects
        CapitanAmerica_ElPrimerVengador CapitanaMarvel SuperMarioBros ElSenorDeLosAnillos_LaGuerraDeLosRohirrim ElSenorDeLosAnillos_AnillosDePoder - contenido
        lunes martes miercoles jueves viernes sabado domingo - dia
    )
    (:init
        ; Peliculas que el usuario quiere ver
        (quiereVer CapitanaMarvel)
        (quiereVer SuperMarioBros)
        (quiereVer ElSenorDeLosAnillos_AnillosDePoder)

        ; Predecesores de las peliculas
        (predecesor CapitanAmerica_ElPrimerVengador CapitanaMarvel)
        (predecesor ElSenorDeLosAnillos_LaGuerraDeLosRohirrim ElSenorDeLosAnillos_AnillosDePoder)
        
        ; Ningun contenido ha sido visto (por defecto los predicados son falsos)

        (= (contenidosAgendados lunes) 0)
        (= (contenidosAgendados martes) 0)
        (= (contenidosAgendados miercoles) 0)
        (= (contenidosAgendados jueves) 0)
        (= (contenidosAgendados viernes) 0)
        (= (contenidosAgendados sabado) 0)
        (= (contenidosAgendados domingo) 0)

        (= (orden lunes) 1)
        (= (orden martes) 2)
        (= (orden miercoles) 3)
        (= (orden jueves) 4)
        (= (orden viernes) 5)
        (= (orden sabado) 6)
        (= (orden domingo) 7)

        (= (maxContenidosPorDia) 1)

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