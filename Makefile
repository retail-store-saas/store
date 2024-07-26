.PHONY: eks-login
eks-login: $(HOME)/.kube/config

$(HOME)/.kube/config:
	$(if $(CLUSTER_NAME),,$(error CLUSTER_NAME is not set))
	aws eks update-kubeconfig --name $(CLUSTER_NAME)

.PHONY: ecr-login
ecr-login:
	$(if $(AWS_ACCOUNT_ID),,$(error AWS_ACCOUNT_ID is not set))
	aws ecr get-login-password --region ${AWS_REGION} | docker login --username AWS --password-stdin $(AWS_ACCOUNT_ID).dkr.ecr.${AWS_REGION}.amazonaws.com

.PHONY: snyk-test
snyk-test:
	$(if $(SNYK_ORG_ID),,$(error SNYK_ORG_ID is not set))
	./hack/snyk-test-store-services.sh --dir=../ --org=$(SNYK_ORG_ID)

.PHONY: snyk-monitor
snyk-monitor:
	$(if $(SNYK_ORG_ID),,$(error SNYK_ORG_ID is not set))
	./hack/snyk-monitor-store-services.sh --dir=../ --org=$(SNYK_ORG_ID)
