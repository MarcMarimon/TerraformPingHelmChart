# TerraformPingHelmChart
Prueba tecnica de infrastructure as code con Terraform y Helm Chart

# Deploy Helm Chart to AKS

Este repositorio automatiza el despliegue de un Helm Chart en Azure Kubernetes Service (AKS) utilizando Terraform y GitHub Actions.

## Uso

1. **Configurar Credenciales de Azure:**
   Añadir el secreto `AZURE_CREDENTIALS` en GitHub con las credenciales JSON de tu servicio principal de Azure.

3. **Clonar el Repositorio:**
   ```bash
   git clone https://github.com/tu-usuario/tu-repositorio.git
   cd tu-repositorio

4. **Inicializar y Aplicar Terraform:**

   ```bash
   cd terraform/modules/helm_charts
   terraform init
   terraform plan -out=tfplan
   terraform apply tfplan


## Decisiones Técnicas

**Uso de Terraform**
- Infraestructura como Código (IaC): Se eligió Terraform por su capacidad de definir y gestionar infraestructura de manera declarativa y reproducible. Esto permite un control fino sobre la infraestructura y facilita la colaboración en equipo.
- Modularización: El uso de módulos (./terraform/modules/helm_charts) permite organizar la configuración en unidades reutilizables y manejables. Esto mejora la mantenibilidad y la escalabilidad del código.

**GitHub Actions**
- Automatización de CI/CD: GitHub Actions automatiza el proceso de integración continua y entrega continua (CI/CD). Esto asegura que los cambios en la rama main se desplieguen automáticamente, garantizando despliegues consistentes y reduciendo el riesgo de errores manuales.
- Seguridad y Eficiencia: El flujo de trabajo está configurado para utilizar secretos de GitHub para manejar credenciales de manera segura. Además, las tareas están organizadas para optimizar la eficiencia del pipeline, minimizando el tiempo de ejecución y evitando redundancias.

**Helm para Gestión de Aplicaciones Kubernetes**
- Gestión Simplificada: Helm facilita la gestión de aplicaciones en Kubernetes mediante charts. Esto permite la instalación, actualización y eliminación de aplicaciones con facilidad, y asegura que los despliegues sean consistentes y predecibles.
- Configuración Parametrizable: Los charts se configuran mediante parámetros, lo que permite personalizar despliegues sin modificar el código del chart. Esto proporciona flexibilidad para adaptar la configuración a diferentes entornos.

## Conclusión
Este enfoque integrado con Terraform y GitHub Actions garantiza una infraestructura robusta y un proceso de despliegue automatizado y seguro. La elección de herramientas y técnicas se basa en prácticas recomendadas para la gestión de infraestructura y aplicaciones en la nube, lo que demuestra un enfoque profesional y eficiente en la automatización de despliegues.
