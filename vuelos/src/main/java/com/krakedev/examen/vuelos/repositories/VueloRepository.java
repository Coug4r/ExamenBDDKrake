package com.krakedev.examen.vuelos.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.krakedev.examen.vuelos.entities.Vuelo;

@Repository
public interface VueloRepository extends JpaRepository<Vuelo, Long> {
    
}
	