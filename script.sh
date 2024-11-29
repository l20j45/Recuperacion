#!/bin/bash

# Crear el directorio
mkdir -p archivos_originales

# Cambiar al directorio creado
cd archivos_originales || exit

# Generar 100 archivos con nombres aleatorios
for i in {1..100}; do
  # Generar un nombre aleatorio para el archivo
  nombre="archivo_$(tr -dc a-z0-9 </dev/urandom | head -c 8).txt"
  
  # Crear el archivo vacío
  touch "$nombre"
  
  # Generar una fecha aleatoria dentro del último año
  dia=$((RANDOM % 365))
  fecha=$(date -d "-$dia days" "+%Y-%m-%d %H:%M:%S")
  
  # Cambiar la fecha de modificación del archivo
  touch -d "$fecha" "$nombre"
done

echo "Se han creado 100 archivos con fechas de modificación variadas en 'archivos_originales'."
