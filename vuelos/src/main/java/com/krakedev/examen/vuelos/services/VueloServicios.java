package com.krakedev.examen.vuelos.services;

import java.math.BigDecimal;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.krakedev.examen.vuelos.entities.Vuelo;
import com.krakedev.examen.vuelos.repositories.VueloRepository;

@Service
public class VueloServicios {

    
    private VueloRepository vueloRepository;
    public VueloServicios(VueloRepository vueloRepository) {
        this.vueloRepository = vueloRepository;
    }
    //  Crear un nuevo vuelo
    public Vuelo crearVuelo(Vuelo vuelo) {
        try {
            return vueloRepository.save(vuelo);
        } catch (Exception e) {
            System.err.println("Error al crear vuelo: " + e.getMessage());
            return null;
        }
    }

    //  Listar todos los vuelos
    public List<Vuelo> listarVuelos() {
        try {
            return vueloRepository.findAll();
        } catch (Exception e) {
            System.err.println("Error al listar vuelos: " + e.getMessage());
            return List.of(); // devuelve lista vacía en caso de error
        }
    }

    //  Buscar vuelo por ID
    public Optional<Vuelo> buscarPorId(Long id) {
        try {
            return vueloRepository.findById(id);
        } catch (Exception e) {
            System.err.println("Error al buscar vuelo por ID: " + e.getMessage());
            return Optional.empty();
        }
    }

    //  Actualizar vuelo
    public Vuelo actualizarVuelo(Long id, Vuelo vueloActualizado) {
        try {
            return vueloRepository.findById(id)
                    .map(vuelo -> {
                        vuelo.setCodigo(vueloActualizado.getCodigo());
                        vuelo.setPrecioBoleto(vueloActualizado.getPrecioBoleto());
                        vuelo.setAsientosDisponibles(vueloActualizado.getAsientosDisponibles());
                        vuelo.setDestino(vueloActualizado.getDestino());
                        return vueloRepository.save(vuelo);
                    })
                    .orElse(null);
        } catch (Exception e) {
            System.err.println("Error al actualizar vuelo: " + e.getMessage());
            return null;
        }
    }

    //  Eliminar vuelo
    public boolean eliminarVuelo(Long id) {
        try {
            if (vueloRepository.existsById(id)) {
                vueloRepository.deleteById(id);
                return true;
            }
            return false;
        } catch (Exception e) {
            System.err.println("Error al eliminar vuelo: " + e.getMessage());
            return false;
        }
    }
    // Buscar por precios menores a
    public List<Vuelo> buscarPorPreciosMenor(BigDecimal precio) {
        try {
            return vueloRepository.findByPrecioBoletoLessThan(precio);
        } catch(Exception e) {
            System.err.println("Error al buscar vuelos: " + e.getMessage());
            return Collections.emptyList(); 
        }
    }

}
