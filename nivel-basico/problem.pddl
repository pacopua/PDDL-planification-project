(define (problem PROBLEMA_NIVELBASICO)
    (:domain DOMAIN_NIVELBASICO)
    (:objects
        CapitanAmerica_ElPrimerVengador CapitanaMarvel SuperMarioBros ElSenorDeLosAnillos_LaGuerraDeLosRohirrim ElSenorDeLosAnillos_AnillosDePoder ElHobbit_UnViajeInesperado - contenido
        lunes martes miercoles jueves viernes sabado domingo - dia
    )
    (:init
        ; Peliculas que el usuario quiere ver
        (tienequever CapitanaMarvel)
        (tienequever SuperMarioBros)
        (tienequever ElHobbit_UnViajeInesperado)

        ; Predecesores de las peliculas
        (predecesor CapitanAmerica_ElPrimerVengador CapitanaMarvel)
        (predecesor ElSenorDeLosAnillos_LaGuerraDeLosRohirrim ElSenorDeLosAnillos_AnillosDePoder)
        (predecesor ElSenorDeLosAnillos_AnillosDePoder ElHobbit_UnViajeInesperado)
        
        ; Estado inicial: ninguno ha sido visto ni agendado
        (not (havisto CapitanAmerica_ElPrimerVengador))
        (not (havisto CapitanaMarvel))
        (not (havisto SuperMarioBros))
        (not (havisto ElSenorDeLosAnillos_LaGuerraDeLosRohirrim))
        (not (havisto ElSenorDeLosAnillos_AnillosDePoder))
        (not (havisto ElHobbit_UnViajeInesperado))

        ; Ninguna pelicula ha sido agendada
        (not (agendado CapitanAmerica_ElPrimerVengador))
        (not (agendado CapitanaMarvel))
        (not (agendado SuperMarioBros))
        (not (agendado ElSenorDeLosAnillos_LaGuerraDeLosRohirrim))
        (not (agendado ElSenorDeLosAnillos_AnillosDePoder))
        (not (agendado ElHobbit_UnViajeInesperado))

        ; Ningun dia ha sido llenado
        (not (lleno lunes))
        (not (lleno martes))
        (not (lleno miercoles))
        (not (lleno jueves))
        (not (lleno viernes))
        (not (lleno sabado))
        (not (lleno domingo))

        ; Predecesores no agendados
        (not (predecesoresAgendados CapitanaMarvel))
        (not (predecesoresAgendados ElSenorDeLosAnillos_AnillosDePoder))
        (not (predecesoresAgendados ElHobbit_UnViajeInesperado))
    )
    (:goal
        (and
            ; Todas las peliculas han sido agendadas
            (agendado CapitanAmerica_ElPrimerVengador)
            (agendado CapitanaMarvel)
            (agendado SuperMarioBros)
            (agendado ElSenorDeLosAnillos_LaGuerraDeLosRohirrim)
            (agendado ElSenorDeLosAnillos_AnillosDePoder)
            (agendado ElHobbit_UnViajeInesperado)
        )
    )
)