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
	stage('solo se ejecuta en segunda'){
		when{
			expression{ env.BRANCH_NAME == "segunda"}
		}
		steps{
			sh 'cat filecillo'
		}
	}
	stage('solo se ejecuta en tercera'){
		when{
			expression{ env.BRANCH_NAME == "tercera" }
		}
		steps{
				sh 'echo "esto se ejecuta desde tercera"'
		}
	}
		
	}
}
