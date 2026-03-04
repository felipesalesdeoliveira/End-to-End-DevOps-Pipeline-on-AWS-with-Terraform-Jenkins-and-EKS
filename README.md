# 🚀 End-to-End-DevOps-Pipeline-on-AWS-with-Terraform-Jenkins-and-EKS

![architecture](architecture.png)

------------------------------------------------------------------------

# 📌 Sobre o Projeto

Este projeto demonstra a implementação de um **pipeline DevOps completo
executando na AWS**, provisionado inteiramente com **Infrastructure as
Code utilizando Terraform**.

O objetivo é simular um **ambiente DevOps real**, incluindo
provisionamento de infraestrutura, automação de CI/CD, orquestração de
containers, deploy via GitOps e observabilidade.

O pipeline automatiza todo o ciclo de entrega de software:

-   Integração de código
-   Build e testes
-   Análise de qualidade de código
-   Criação de imagens Docker
-   Deploy em Kubernetes
-   Entrega contínua com GitOps
-   Monitoramento e observabilidade

Essa arquitetura representa práticas modernas utilizadas em ambientes
corporativos.

------------------------------------------------------------------------

# 🏗️ Arquitetura da Solução

A solução é executada na **Amazon Web Services (AWS)** e inclui diversos
componentes DevOps integrados.

Componentes principais da infraestrutura:

-   Amazon VPC
-   Amazon EKS (Kubernetes)
-   Instâncias EC2 para ferramentas CI/CD
-   Registro de imagens Docker
-   Repositórios GitHub
-   Stack de monitoramento

Toda a infraestrutura é provisionada automaticamente com **Terraform**.

------------------------------------------------------------------------

# ⚙️ Fluxo do Pipeline DevOps

1.  Desenvolvedor envia código para o **GitHub**
2.  O GitHub dispara o **pipeline do Jenkins**
3.  Jenkins executa build, testes e análise de qualidade com
    **SonarQube**
4.  Jenkins cria uma **imagem Docker**
5.  A imagem é enviada para **DockerHub ou Amazon ECR**
6.  Jenkins atualiza os manifests Kubernetes no repositório **GitOps**
7.  **ArgoCD detecta a mudança** e realiza o deploy no Kubernetes
8.  A aplicação passa a rodar no **Amazon EKS**
9.  **Prometheus e Grafana monitoram a aplicação**

------------------------------------------------------------------------

# ☁️ Infraestrutura AWS

A infraestrutura é provisionada com **Terraform** e inclui:

-   VPC com subnets públicas e privadas
-   Internet Gateway
-   Security Groups
-   Cluster Amazon EKS
-   Node Groups gerenciados
-   Instâncias EC2 para Jenkins e SonarQube
-   IAM Roles e políticas de acesso

Todos os recursos são definidos como código, permitindo provisionamento
automatizado e reproduzível.

------------------------------------------------------------------------

# 🐳 Containerização

As aplicações são empacotadas como **containers Docker**.

O pipeline automatiza:

-   Build das imagens
-   Versionamento das imagens
-   Envio para o registry

Isso garante consistência entre ambientes.

------------------------------------------------------------------------

# ☸️ Deploy com Kubernetes (EKS)

As aplicações são implantadas no **Amazon EKS**, que fornece:

-   Orquestração de containers
-   Alta disponibilidade
-   Escalabilidade
-   Deploy automatizado

------------------------------------------------------------------------

# 🔁 Entrega Contínua com GitOps

O deploy é gerenciado utilizando **GitOps com ArgoCD**.

O ArgoCD monitora continuamente um repositório Git contendo os manifests
Kubernetes.

Quando uma nova versão da imagem é atualizada:

-   ArgoCD detecta a alteração
-   Sincroniza o cluster
-   Realiza o deploy automaticamente

------------------------------------------------------------------------

# 📊 Observabilidade

Monitoramento implementado com:

-   **Prometheus** para coleta de métricas
-   **Grafana** para dashboards
-   **Loki** para centralização de logs

------------------------------------------------------------------------

# 📂 Estrutura do Repositório

    devops-end-to-end-pipeline-aws/

    terraform/
    ├── vpc
    ├── eks
    ├── ec2-jenkins
    └── ec2-sonarqube

    app/
    └── sample-application

    docker/
    └── Dockerfile

    jenkins/
    └── Jenkinsfile

    kubernetes/
    ├── deployment.yaml
    └── service.yaml

    argocd/
    └── application.yaml

------------------------------------------------------------------------

# 🚀 Provisionamento da Infraestrutura

Inicializar Terraform:

``` bash
terraform init
```

Planejar infraestrutura:

``` bash
terraform plan
```

Aplicar infraestrutura:

``` bash
terraform apply
```

------------------------------------------------------------------------

# 📈 Conceitos DevOps Demonstrados

-   Infrastructure as Code (Terraform)
-   Integração Contínua (Jenkins)
-   Entrega Contínua com GitOps (ArgoCD)
-   Containerização com Docker
-   Orquestração Kubernetes (EKS)
-   Observabilidade (Prometheus, Grafana, Loki)

------------------------------------------------------------------------

# ⭐ Se este projeto foi útil

Considere:

-   Dar uma estrela ⭐ no repositório
-   Compartilhar com sua rede
-   Contribuir com melhorias