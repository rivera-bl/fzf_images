apply:
	@cd environment && \
		terraform init && \
		terraform apply --auto-approve
	@cd environment && \
		docker build . \
		-t 371613581172.dkr.ecr.us-east-1.amazonaws.com/apple \
		-t 371613581172.dkr.ecr.us-east-1.amazonaws.com/banana \
		-t 371613581172.dkr.ecr.us-east-1.amazonaws.com/orange \
		-t 371613581172.dkr.ecr.us-east-1.amazonaws.com/apple:1.0 \
		-t 371613581172.dkr.ecr.us-east-1.amazonaws.com/banana:1.0 \
		-t 371613581172.dkr.ecr.us-east-1.amazonaws.com/orange:1.0
	@cd environment && \
		docker push 371613581172.dkr.ecr.us-east-1.amazonaws.com/apple:latest && \
		docker push 371613581172.dkr.ecr.us-east-1.amazonaws.com/banana:latest && \
		docker push 371613581172.dkr.ecr.us-east-1.amazonaws.com/orange:latest && \
		docker push 371613581172.dkr.ecr.us-east-1.amazonaws.com/apple:1.0 && \
		docker push 371613581172.dkr.ecr.us-east-1.amazonaws.com/banana:1.0 && \
		docker push 371613581172.dkr.ecr.us-east-1.amazonaws.com/orange:1.0
	@cd environment && \
		mkdir -p tar/{apple,banana,orange} && \
		docker save 371613581172.dkr.ecr.us-east-1.amazonaws.com/apple > tar/apple/apple.tar && \
		docker save 371613581172.dkr.ecr.us-east-1.amazonaws.com/banana > tar/banana/banana.tar && \
		docker save 371613581172.dkr.ecr.us-east-1.amazonaws.com/orange > tar/orange/orange.tar
	@cd -

clean:
	@cd environment && \
		terraform destroy --auto-approve
	@cd -

test:
	$(eval VAR := testing )
	@echo $(VAR)
