pipeline{
	agent any
	stages{
	stage('ejecutando en el master'){
		steps{
			sh 'ip addr show'
		}
	}
	stage('ejecutando en el agente'){
		agent{
			label 'docker'
		}
		steps{
			sh 'ip addr show'
		}
	}
	stage('solo ejecutar en segunda'){
		when{
		    expression { env.BRANCH_NAME == "segunda"}
		}
		steps{
			sh 'cat filecillo'
		}
	}
		
	}
}
