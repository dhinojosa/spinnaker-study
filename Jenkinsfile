node {
	stage('Checkout') {
		//sh "Url is ${env.GIT_URL}"
		git "https://github.com/dhinojosa/quarkus-microservice.git"
	}
	stage('Build Container') {
		docker.build('${JOB_NAME}', '-f src/main/docker/Dockerfile.jvm')
	}
	stage('Push to ECR') {
		docker.withRegistry('https://219099013464.dkr.ecr.us-west-2.amazonaws.com', 'ecr:us-west-2:dhinojosa-aws') {
			docker.image('${JOB_NAME}').push('${BUILD_ID}')
	   }
	}
}
