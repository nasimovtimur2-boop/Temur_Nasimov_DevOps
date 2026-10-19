pipeline {
    agent any
    environment {
        STUDENT_NAME = 'Temur'
        STUDENT_SURNAME = 'Nasimov'
        STUDENT_GROUP = 'IT 2 2312'
        STUDENT_ID = '31915'
        DOCKER_IMAGE = 'nasimov-temur-devops'
        DOCKER_CONTAINER = 'nasimov-temur-jenkins'
    }
    stages {
        stage('Checkout') {
            steps { checkout scm }
        }
        stage('Build') {
            steps { sh 'python3 -m compileall -q app' }
        }
        stage('Test') {
            steps { sh 'cd app && python3 -m unittest discover -v' }
        }
        stage('Docker Build') {
            steps { sh 'docker build -t "$DOCKER_IMAGE:$BUILD_NUMBER" .' }
        }
        stage('Docker Run') {
            steps {
                sh '''
                    docker rm -f "$DOCKER_CONTAINER" 2>/dev/null || true
                    docker run -d --name "$DOCKER_CONTAINER" \\
                      -e STUDENT_NAME="$STUDENT_NAME" \\
                      -e STUDENT_SURNAME="$STUDENT_SURNAME" \\
                      -e STUDENT_GROUP="$STUDENT_GROUP" \\
                      -e STUDENT_ID="$STUDENT_ID" \\
                      "$DOCKER_IMAGE:$BUILD_NUMBER"
                    sleep 2
                    docker exec "$DOCKER_CONTAINER" python -c "import urllib.request; print(urllib.request.urlopen('http://127.0.0.1:8080/health').read().decode())"
                    docker logs "$DOCKER_CONTAINER"
                '''
            }
        }
    }
    post {
        success { echo "Student: ${env.STUDENT_NAME} ${env.STUDENT_SURNAME}; Group: ${env.STUDENT_GROUP}; ID: ${env.STUDENT_ID}; Finished: SUCCESS" }
        failure { echo 'Pipeline failed: inspect failing stage logs.' }
    }
}
