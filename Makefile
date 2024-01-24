git:
	git pull
	cd learn-terraform/
	cd 04-vars/
apply:git
	terraform init
	terraform apply -auto-approve