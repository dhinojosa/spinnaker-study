pipeline {
    agent any

    tools {
        maven 'maven-3.8.4'
        jdk 'JDK 11'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Build') {
            steps {
                sh './mvnw clean package'
//                sh '${POM_VERSION}'
            }
        }
        stage('Build Container') {
            steps {
                script {
                    docker.build("${JOB_NAME}", '-f src/main/docker/Dockerfile.jvm .')
                }
            }
        }
        stage('Create tar.gz') {
            steps {
               sh 'tar -czvf quarkus-microservice-chart.tar.gz -C helm quarkus-microservice'
               archiveArtifacts artifacts: 'quarkus-microservice-chart.tar.gz', fingerprint: true
            }
        }
	    stage('Push chart to S3') {
            steps {
	           withAWS(region:'us-west-2', credentials:'spinnaker-admin-aws') {
                  s3Upload(file:'quarkus-microservice-chart.tar.gz', bucket:'helm-charts-f2bba284-98d3-445b-9f04-a08c57b7d36e', path:"${JOB_NAME}/${BUILD_ID}/quarkus-microservice-chart.tar.gz")
               }
            }
        }        
        stage('Write properties') {
            steps {
                sh "> spinnaker.properties"
                sh "echo 'JOB_NAME=${JOB_NAME}' >> spinnaker.properties"
                sh "echo 'BUILD_ID=${BUILD_ID}' >> spinnaker.properties"
                archiveArtifacts artifacts: 'spinnaker.properties', fingerprint: true
            }
        }
        stage('Push to ECR') {
            steps {
                script {
                    docker.withRegistry('https://219099013464.dkr.ecr.us-west-2.amazonaws.com', 'ecr:us-west-2:spinnaker-admin-aws') {
                        docker.image("${JOB_NAME}").push("${BUILD_ID}")
                    }
                }
            }
        }
    }
}
