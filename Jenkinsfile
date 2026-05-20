pipeline {
    agent any

    environment {
        SCANNER_HOME = tool 'sonar-scanner'
    }

    tools {
        maven 'Maven3'
        jdk 'JDK17'
    }

    stages {

        stage('Hello') {
            steps {
                echo 'Hello World'
            }
        }

        stage('Git Checkout') {
            steps {
                git 'https://github.com/rpratyusha121-cell/taxi.git'
            }
        }

        stage('Compile') {
            steps {
                sh 'mvn compile'
            }
        }

        stage('Test') {
            steps {
                sh 'mvn test'
            }
        }

        stage('File System Scan') {
            steps {
                sh 'trivy fs --format table -o trivy-fs-report.html .'
            }
        }

        stage('SonarQube') {
            steps {
                withSonarQubeEnv('sonar') {
                    sh """
                        \$SCANNER_HOME/bin/sonar-scanner \
                        -Dsonar.projectKey=taxi \
                        -Dsonar.projectName=taxi \
                        -Dsonar.sources=server/src/main/java \
                        -Dsonar.java.binaries=server/target
                    """
                }
            }
        }
    }
}
