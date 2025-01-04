(define (domain DOMAIN_NIVELBASICO)
    (:requirements :typing :adl :fluents)
    (:types
        contenido dia - object
    )
    (:predicates
        (haVisto ?c - contenido)                        ; Es un contenido que el usuario ha visto
        (quiereVer ?c - contenido)                      ; Es un contenido que el usuario quiere ver
        (predecesor ?c1 - contenido ?c2 -  contenido)   ; El contenido c1 es predecesor al contenido c2
        (necesarioAgendar ?c - contenido)               ; Es un contenido pendiente por agendar. Ya sea porque el usuario queire verlo o porque pertenece a una cadena de predecesores.
        (agendado ?c - contenido ?d - dia)              ; El contenido c ha sido agendado al dia d
    )
    (:functions
        (orden ?d - dia)
        (contenidosAgendados ?d - dia)
        (maxContenidosPorDia)
    )
    (:action requerimiento
        :parameters (
            ?c - contenido
        )
        :precondition
            (and
                (not (necesarioAgendar ?c))
                (not (haVisto ?c))
                (not 
                    (exists (?d - dia)
                        (agendado ?c ?d)
                    )
                )
                (or
                    (quiereVer ?c)
                    (exists (?c2 - contenido)
                        (and
                            (predecesor ?c ?c2)
                            (necesarioAgendar ?c2)
                        )
                    )
                )
            )
        :effect
            (necesarioAgendar ?c)
    )
    (:action agendar
        :parameters (
            ?c - contenido
            ?d - dia
        )
        :precondition 
            (and
                (necesarioAgendar ?c)
                (<
                    (contenidosAgendados ?d)
                    (maxContenidosPorDia)
                )
                ; Todos sus predecesores o bien han sido vistos o bien han sido asignados en el mismo dia o anteriores
                (forall (?c2 - contenido)
                    (imply
                        (predecesor ?c2 ?c)
                        (or
                            (haVisto ?c2)
                            (exists (?d2 - dia)
                                (and
                                    (<=
                                        (orden ?d2)
                                        (orden ?d)
                                    )
                                    (agendado ?c2 ?d2)
                                )
                            )
                        )
                    )
                )
            )
        :effect
            (and
                (not (necesarioAgendar ?c))
                (agendado ?c ?d)
                (increase
                    (contenidosAgendados ?d)
                    1
                )
            )
    )
)
