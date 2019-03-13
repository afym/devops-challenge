# DevOps challenge solution

```bash
git clone git@github.com:afym/devops-challenge.git
```

```bash
cd devops-challenge/01-aws-docker-jenkins/
terraform init
terraform plan -var-file=variables\us-west-2.tfvars
terraform apply -var-file=variables\us-west-2.tfvars
```

```bash
Go to http://x.x.x.x:8080
Install Jenkins
Install the following plugins
  * https://plugins.jenkins.io/docker-plugin
  * 
```
Application for usage : https://github.com/afym/springboot-application-ci.git
Application for usage : https://github.com/afym/springboot-application-cd.git
Application for usage : https://github.com/afym/springboot-application-test.git

Create a Job called application-build (pipeline)

