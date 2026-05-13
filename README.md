# Proyecto-final---Veterinaria-Maria-Fernanda-Gallo-Serrano-y-Gabriel-Fernando-Villar-Suarez-
# Sistema de Gestión Veterinaria 

Integrantes:
* Maria Fernanda Gallo Serrano
* Gabriel Fernando Villar Suarez
  
Descripción:
Proyecto final de programación en Java utilizando Spring Boot, MySQL y JPA. 
Este repositorio contiene la documentación inicial y el script de la base de datos.

Resumen del Proyecto: Sistema BioVet UTS   
BioVet UTS es una solución tecnológica integral diseñada para modernizar la gestión administrativa y clínica de centros veterinarios. El proyecto surge como respuesta a la necesidad de digitalizar los procesos en clínicas pequeñas y medianas que aún dependen de registros manuales, lo que optimiza la atención al paciente y garantiza la seguridad de la información médica. 

Objetivo Central:Desarrollar un sistema de información web que centralice los datos de pacientes, propietarios y procedimientos médicos. El sistema busca mejorar la logística del centro mediante la automatización de citas y el seguimiento detallado de historias clínicas digitales.  

Arquitectura y Stack Tecnológico   
El software se ha construido bajo estándares profesionales para asegurar escalabilidad y mantenimiento sencillo:   
 -Backend: Java 17 con el framework Spring Boot (Spring Data JPA y Spring Web). 
 -Frontend: Interfaz intuitiva y adaptable desarrollada con Thymeleaf, HTML5, CSS3 y Bootstrap 5.  
 -Base de Datos: Motor MySQL con una estructura relacional que garantiza la integridad referencial.  
 -Control de Versiones: Git con repositorio alojado en GitHub.  
 
 Funcionalidades Principales (Requerimientos)   
 -Gestión Integral (CRUD): Administración completa de propietarios, pacientes (mascotas) y talento humano (veterinarios).  
 -Control de Citas: Módulo automatizado para la asignación de turnos médicos que evita duplicidad de horarios.  
 -Historia Clínica Digital: Registro cronológico y persistente de diagnósticos y tratamientos con marcas temporales automáticas.  
 -Seguridad y Roles: Sistema de autenticación que diferencia las funciones entre Administradores (gestión global) y Personal Médico (asistencia y diagnósticos).  

Diseño de Datos:   
El sistema se apoya en un modelo de base de datos robusto con 7 tablas principales interconectadas (Roles, Usuarios, Clientes, Mascotas, Directorio Médico, Citas e Historial Médico). Esta estructura permite un manejo seguro de la información, incluyendo borrados en cascada para mantener la consistencia de los registros vinculados. 
