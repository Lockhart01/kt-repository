pipeline{
	agent {
		docker{
			image 'maven:3.5.2-jdk-7-alpine'
			args '-v m2:/tmp'
			label 'docker'
		}
	}
	environment{
		JAVA_TOOLS_OPTIONS = '-Duser.home=/tmp'
	}
	stages{
		stage('Checkout'){
			steps{
				checkout([$class: 'GitSCM', branches: [[name: '*/cuarta']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/Lockhart01/kt-repository']]])
				stash includes: '', name: 'app', allowEmpty: false
			}
			
		}
		stage('Build'){
			steps{
				unstash 'app'
				sh 'cd myapp && mvn clean package'
				sh 'cd myapp/target && java -jar myapp.jar > output.txt'
				stash includes: 'myapp/target/output.txt', name: 'output', allowEmpty: false
			}
		}
		stage('delivery'){
			steps{
				unstash 'output'
				archiveArtifacts artifacts: 'myapp/target/output.txt', followSymlinks: false
			}
		}
	}
}