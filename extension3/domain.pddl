(define (domain DOMAIN_EXTENSION3)
    (:requirements :typing :adl :fluents)
    (:types
        contenido dia - object
    )
    (:predicates
        (haVisto ?c - contenido)                        ; Es un contenido que el usuario ha visto
        (quiereVer ?c - contenido)                      ; Es un contenido que el usuario quiere ver
        (predecesor ?c1 - contenido ?c2 -  contenido)   ; El contenido c1 es predecesor al contenido c2
        (paralelo ?c1 - contenido ?c2 - contenido)      ; El contenido c1 es paralelo al contenido c2
        (necesarioAgendar ?c - contenido)               ; Es un contenido pendiente por agendar. Ya sea porque el usuario queire verlo o porque pertenece a una cadena de predecesores.
        (agendado ?c - contenido ?d - dia)              ; El contenido c ha sido agendado al dia d
    )
    (:functions
        (orden ?d - dia)
        (contenidosAgendados ?d - dia)
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
                            (or 
                                (predecesor ?c ?c2)
                                (paralelo ?c ?c2)
                                (paralelo ?c2 ?c)
                            )
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
                    3
                )
                ; Todos sus predecesores o bien han sido vistos o bien han sido asignados en dias anteriores
                (forall (?c2 - contenido)
                    (imply
                        (predecesor ?c2 ?c)
                        (or
                            (haVisto ?c2)
                            (exists (?d2 - dia)
                                (and
                                    (<
                                        (orden ?d2)
                                        (orden ?d)
                                    )
                                    (agendado ?c2 ?d2)
                                )
                            )
                        )
                    )
                )
                ; Todos los paralelos agendados estan agendados en el mismo dia, un anterior o el siguiente
                (forall (?c2 - contenido)
                    (imply
                        (and
                            (or
                                (paralelo ?c ?c2)
                                (paralelo ?c2 ?c)
                            )
                            (exists (?d2 - dia)
                                (agendado ?c2 ?d2)
                            )
                        )
                        (exists (?d2 - dia)
                            (and
                                (agendado ?c2 ?d2)
                                (or
                                    (=
                                        (orden ?d2)
                                        (orden ?d)
                                    )
                                    (=
                                        (orden ?d2)
                                        (-
                                            (orden ?d)
                                            1
                                        )
                                    )
                                    (=
                                        (orden ?d2)
                                        (+
                                            (orden ?d)
                                            1
                                        )
                                    )
                                )
                            )
                        )
                    )
                )
                ; Para agendar paralelos que no son objetivo primero
                (imply
                    (quiereVer ?c)
                    (not
                        (exists (?c2 - contenido)
                            (and
                                (not 
                                    (haVisto ?c2)
                                )
                                (or
                                    (paralelo ?c ?c2)
                                    (paralelo ?c2 ?c)
                                )
                                (not
                                    (exists (?d2 - dia)
                                        (agendado ?c2 ?d2)
                                    )
                                )
                                (not
                                    (quiereVer ?c2)
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
