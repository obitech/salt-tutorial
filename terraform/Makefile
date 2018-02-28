VARSFILE=terraform.tfvars
TF=terraform
KEYS_N=2
KEYS_PREFIX=salt_ssh

full: genkeys apply

genkeys: 
	./genkeys.sh -n $(KEYS_N) -p $(KEYS_PREFIX)

apply: 
	$(TF) apply -var-file=$(VARSFILE)

plan: 
	$(TF) plan -var-file=$(VARSFILE)

clean:
	$(TF) destroy -var-file=$(VARSFILE)
	rm -rf keys/*