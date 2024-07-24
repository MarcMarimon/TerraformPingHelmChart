# TerraformPingHelmChart
Prueba tecnica de infrastructure as code con Terraform y Helm Chart

# Deploy Helm Chart to AKS

Este repositorio automatiza el despliegue de un Helm Chart en Azure Kubernetes Service (AKS) utilizando Terraform y GitHub Actions.

## Uso

1. **Configurar Credenciales de Azure:** Añadir el secreto `AZURE_CREDENTIALS` en GitHub con las credenciales JSON de tu servicio principal de Azure.

2. **Clonar el Repositorio:**
   ```bash
   git clone https://github.com/tu-usuario/tu-repositorio.git
   cd tu-repositorio

3. **Inicializar y Aplicar Terraform:**

   ```bash
   cd terraform/modules/helm_charts
   terraform init
   terraform plan -out=tfplan
   terraform apply tfplan


Este repositorio automatiza el CI/CD, ejecutando el flujo de trabajo en cada push a la rama main, integrando pasos como autenticación en Azure, configuración de CLI, y despliegue con Helm.
