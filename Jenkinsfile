pipeline {
    agent any

    stages {

        stage('Hello from Jenkins') {
            steps {
                echo 'Hello from Jenkins 🚀'
            }
        }

        stage('Connect to Server') {
            steps {
                sshagent(['docker-ssh']) {
                    sh '''
                        ssh -o StrictHostKeyChecking=no ubuntu@YOUR_EC2_IP "echo Connected Successfully"
                    '''
                }
            }
        }

        stage('Pull Latest Code') {
            steps {
                sshagent(['docker-ssh']) {
                    sh '''
                        ssh -o StrictHostKeyChecking=no ubuntu@YOUR_EC2_IP << 'EOF'

                        set -e
                        cd /home/ubuntu/jenkins-pipeline-docker
                        git pull origin main

                        EOF
                    '''
                }
            }
        }

        stage('Deploy with Docker') {
            steps {
                sshagent(['docker-ssh']) {
                    sh '''
                        ssh -o StrictHostKeyChecking=no ubuntu@YOUR_EC2_IP << 'EOF'

                        set -e
                        cd /home/ubuntu/jenkins-pipeline-docker
                        sudo docker compose up --build -d

                        EOF
                    '''
                }
            }
        }
    }
}
