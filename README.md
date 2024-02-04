This are just samples of two manifest files used to create a deployment and service from my DevOp training: case of nginx.
the manifest files (for creating a svc & deplyt) work just as it is.
I included some notes inside for your better understanding.
NB= to create a svc:{kubectl apply -f nginx-service.ymal} 
And to create a deployt:{kubectl apply -f nginx-deployment.ymal} from your CLI using these two configuration files.

The nexus-config.txt file will help you to configure the pom.xml and settings.xml from your local server to enable you to deploy (mvn deploy) your built artifact (mvn package) to nexus artifactory repository.
