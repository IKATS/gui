@Library('jsl')_
pipeline {
    agent any
    stages {
        stage('Fetch SCM') {
            steps {
                checkout scm
            }
        }

        stage('Build and push images') {
            agent { node { label 'docker' } }
            steps {
                script {
                    dockerBuild 'hub.ops.ikats.org/gui'
                }
            }
        }
    }
}
