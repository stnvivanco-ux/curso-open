# Imagen base
FROM savivancofi/cursosv:1

# Directorio de trabajo
WORKDIR /app

RUN addgroup --system appgroup && adduser --system --group appuser

# Copiar archivos de la aplicación
COPY app.py /app

# Instalar dependencias
RUN pip install flask

RUN chown -R appuser:appgroup /app

USER appuser

# Exponer el puerto
EXPOSE 3000

# Comando de ejecución
CMD ["python", "app.py"]