node {
	stage('Checkout') {
		git '${GIT_URL}'
	}
	stage('Build Container') {
		docker.build('${JOB_NAME}')
	}
	stage('Push to ECR') {
		docker.withRegistry('https://219099013464.dkr.ecr.us-west-2.amazonaws.com', 'ecr:us-west-2:dhinojosa-aws') {
			docker.image('${JOB_NAME}').push('${BUILD_ID}')
	   }
	}
}
