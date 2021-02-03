pipeline{
	agent any
	tools{
		maven 'M3'
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
				stash includes: 'cd myapp/target/myapp/output.txt', name: 'output', allowEmpty: false
			}
		}
		stage('delivery'){
			steps{
				unstash 'output'
				archiveArtifacts artifacts: 'output.txt', followSymlinks: false
			}
		}
	}
}