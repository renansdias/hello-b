node {
	stage 'Checkout Repo'
	git changelog: false, url: 'https://github.com/renansdias/hello-b'
	
	stage 'Build Docker Image'
	def hash = sh(script: 'git rev-parse HEAD | cut -c1-6 | tr -d \'\n\'', returnStdout: true)
	env.HASH = "${hash}"
	
	sh('docker build -t renansdias/hello-b:${HASH} .')
	
	stage 'Push Docker Image'
	sh('docker push renansdias/hello-b:${HASH}')
	
	stage 'Deploy to Kubernetes'
	sh('sed -i \'s/__VERSION__/\'${HASH}\'/g\' deployment-b.json')
	
	sh('kubectl apply -f deployment-b.json --context="aws_k8s" --kubeconfig="/var/lib/jenkins/.kube/config"')
	
	if (serviceName != 'service/service-b') {
		sh('kubectl apply -f service-b.json --context="aws_k8s" --kubeconfig="/var/lib/jenkins/.kube/config"')
	}
}