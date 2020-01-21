node {
	stage('Checkout') {
		checkout scm
		//sh "Url is ${env.GIT_URL}"
		//git "https://github.com/dhinojosa/quarkus-microservice.git"
	}
	stage('Build Project') {
      sh './mvnw package'
	}
	stage('Build Container') {
		docker.build('${JOB_NAME}', '-f src/main/docker/Dockerfile.jvm .')
	}
	stage('Push to ECR') {
		docker.withRegistry('https://219099013464.dkr.ecr.us-west-2.amazonaws.com', 'ecr:us-west-2:spinnaker-admin-aws') {
			docker.image('${JOB_NAME}').push('${BUILD_ID}')
			docker.image('${JOB_NAME}').push('latest')
	   }
	}
}
