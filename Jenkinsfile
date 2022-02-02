pipeline {
    agent any

    tools {
        maven 'maven-3.8.4'
        jdk 'JDK 17'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Build') {
            steps {
                sh './mvnw clean package -DskipTests'
                archiveArtifacts artifacts: 'target/*.deb'
                sh '${POM_VERSION}'
            }
        }
        stage('Build Container') {
            steps {
                script {
                    docker.build('${JOB_NAME}', '-f src/main/docker/Dockerfile.jvm .')
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
                        docker.image('${JOB_NAME}').push('${BUILD_ID}')
                    }
                }
            }
        }
    }
}
