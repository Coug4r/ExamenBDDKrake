package com.krakedev.examen.vuelos.controllers;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.krakedev.examen.vuelos.entities.Vuelo;
import com.krakedev.examen.vuelos.services.VueloServicios;

@RestController
@RequestMapping("/vuelos")
public class VueloController {

    @Autowired
    private VueloServicios vueloService;

    //  Crear vuelo
    @PostMapping
    public ResponseEntity<Vuelo> crearVuelo(@RequestBody Vuelo vuelo) {
        Vuelo nuevoVuelo = vueloService.crearVuelo(vuelo);
        if (nuevoVuelo != null) {
            return ResponseEntity.status(HttpStatus.CREATED).body(nuevoVuelo);
        }
        return ResponseEntity.status(HttpStatus.BAD_REQUEST).build();
    }

    //  Listar todos los vuelos
    @GetMapping
    public ResponseEntity<List<Vuelo>> listarVuelos() {
        List<Vuelo> vuelos = vueloService.listarVuelos();
        return ResponseEntity.ok(vuelos);
    }

    //  Buscar vuelo por ID
    @GetMapping("/{id}")
    public ResponseEntity<?> buscarPorId(@PathVariable Long id) {
        Optional<Vuelo> vuelo = vueloService.buscarPorId(id);
        if (vuelo.isPresent()) {
            return ResponseEntity.ok(vuelo.get());
        }
        return ResponseEntity.status(HttpStatus.NOT_FOUND)
                .body("Vuelo con id " + id + " no encontrado");
    }

    //  Actualizar vuelo
    @PutMapping("/{id}")
    public ResponseEntity<?> actualizarVuelo(@PathVariable Long id, @RequestBody Vuelo vueloActualizado) {
        Vuelo vuelo = vueloService.actualizarVuelo(id, vueloActualizado);
        if (vuelo != null) {
            return ResponseEntity.ok(vuelo);
        }
        return ResponseEntity.status(HttpStatus.NOT_FOUND)
                .body("No se pudo actualizar, vuelo con id " + id + " no existe");
    }

    //  Eliminar vuelo
    @DeleteMapping("/{id}")
    public ResponseEntity<?> eliminarVuelo(@PathVariable Long id) {
        boolean eliminado = vueloService.eliminarVuelo(id);
        if (eliminado) {
            return ResponseEntity.ok("Vuelo con id " + id + " eliminado correctamente");
        }
        return ResponseEntity.status(HttpStatus.NOT_FOUND)
                .body("Vuelo con id " + id + " no encontrado");
    }
}
