pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                git branch: 'main', url: 'https://github.com/sharmila-syed2024/SampleJenkinsPipeline.git'
            }
        }
        stage('Running Script') {
            steps {
                sh 'chmod +x system_admin.sh'
                sh './system_admin.sh'
            }
        }
    }
}




