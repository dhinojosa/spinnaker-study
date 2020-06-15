node {
	stage('Checkout') {
		checkout scm
	}
	stage('Build Project') {
      sh './mvnw clean package'
	}
	stage('Build Container') {
		docker.build('${JOB_NAME}', '-f src/main/docker/Dockerfile.jvm .')
	}
	stage('Create tar.gz') {
       sh 'tar -czvf quarkus-microservice-chart.tar.gz -C helm quarkus-microservice'
       archiveArtifacts artifacts: 'quarkus-microservice-chart.tar.gz', fingerprint: true
	}
	stage('Push chart to S3') {
	    withAWS(region:'us-west-2', credentials:'spinnaker-admin-aws') {
          s3Upload(file:'quarkus-microservice-chart.tar.gz', bucket:'helm-charts-f2bba284-98d3-445b-9f04-a08c57b7d36f', path:"${JOB_NAME}/${BUILD_ID}/quarkus-microservice-chart.tar.gz")
        }
	}
	stage('Write properties') {
	    sh "> spinnaker.properties"
	    sh "echo 'JOB_NAME=${JOB_NAME}' >> spinnaker.properties"
	    sh "echo 'BUILD_ID=${BUILD_ID}' >> spinnaker.properties"
	    archiveArtifacts artifacts: 'spinnaker.properties', fingerprint: true
	}
	stage('Push to ECR') {
		docker.withRegistry('https://465848653329.dkr.ecr.us-west-2.amazonaws.com', 'ecr:us-west-2:spinnaker-admin-aws') {
			docker.image('${JOB_NAME}').push('${BUILD_ID}')
	   }
	}
}
