# aws-eks-super-mario

## Guia de Utilização

Este guia explica como utilizar o Terraform para fazer o deploy de um Amazon EKS (Elastic Kubernetes Service) na AWS (Amazon Web Services) e deploy do jogo Super Mario.

O Terraform é uma ferramenta de infraestrutura como código que permite gerenciar infraestruturas de forma eficiente e escalável.

### Pré-requisitos

Antes de começar, certifique-se de ter o seguinte:

- Conta AWS com permissões para criar recursos.
- Terraform instalado na sua máquina. Você pode instalá-lo seguindo as instruções em [Terraform Install Guide](https://learn.hashicorp.com/tutorials/terraform/install-cli).
- AWS CLI instalado na sua máquina. Você pode instalá-lo seguindo as instruções em [Install AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html).
- Chave de acesso da AWS configurada em sua máquina local. Você pode configurar a chave de acesso seguindo as instruções em [Configuring the AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-files.html).
- Kubectl instalado na sua máquina. Você pode instalá-lo seguindo as instruções em [Kubectl Install Guide](https://kubernetes.io/pt-br/docs/tasks/tools/install-kubectl-linux/).

### Passos para Deploy

Siga os passos abaixo para fazer o deploy do Amazon EKS usando o Terraform:

1. **Clonar o Repositório:**

   Clone este repositório para sua máquina local:

```bash   
git clone https://github.com/jonataaraujo/aws-eks-super-mario.git
```
2. **Configurar o backend:**

Edite o arquivo `backend.tf` e insira os valores adequados.
```yaml
    bucket = "my-bucket"
    key    = "tf/terraform.tfstate"
    region = "us-east-1"
```
OBS: Caso não tenha um bucket, faça a criação antes de iniciar o projeto.

3. **Configurar as Variáveis:**

Edite o arquivo `terraform.tfvars` e insira os valores adequados para as variáveis necessárias. Você pode configurar coisas como a região da AWS, a versão do Kubernetes, o nome do cluster, type da instância, quantidade de nodes.

4. **Inicializar o Terraform:**

No diretório do projeto, execute o comando `terraform init` para inicializar o Terraform e baixar os provedores necessários.

```bash   
terraform init
```

5. **Visualizar o Plano de Execução:**

Antes de fazer o deploy, você pode visualizar o que o Terraform planeja fazer executando o comando `terraform plan`. Isso mostrará todas as mudanças que serão feitas.

```bash   
terraform plan
```

6. **Aplicar as Mudanças:**

Quando estiver pronto para fazer o deploy, execute o comando `terraform apply`. Isso criará todos os recursos definidos no código Terraform.

```bash   
terraform apply
```

7. **Acessar o jogo:**

Após o deploy, você pode acessar o jogo através da URL do Load Balancer, para isso, basta executar o comando `terraform output load_balancer`. Isso mostrará a URL para acesso pelo seu navegador.

```bash
terraform output load_balancer 
```

### Passos para Gerenciamento do cluster

1. **Configurar o Kubectl:**

Após o deploy ser concluído com sucesso, você precisará configurar o `kubectl` para se comunicar com o cluster recém-criado. Execute o seguinte comando:

```bash   
aws eks --region $(terraform output -raw region) update-kubeconfig --name $(terraform output -raw cluster_name)
```

Isso configurará automaticamente o `kubectl` com as credenciais corretas para acessar o cluster.

2. **Verificar o Status do Cluster:**

Após configurar o `kubectl`, você pode verificar o status do cluster executando:

```bash   
kubectl get nodes
```

Isso deve retornar uma lista dos nós (nodes) no cluster.

### Limpeza do ambiente

Para evitar custos desnecessários, é importante destruir os recursos quando não forem mais necessários. Para fazer isso, execute o comando `terraform destroy`:

```bash   
terraform destroy
```

Isso removerá todos os recursos provisionados pelo Terraform.

### Suporte

Se você encontrar problemas ou tiver dúvidas, sinta-se à vontade para abrir uma issue neste repositório.

Agora você deve ter um Amazon EKS implantado, pronto para jogar Super Mario! Divirta-se!