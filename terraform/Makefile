VARSFILE=vars.tfvars
TF=terraform
KEYS_N=3
KEYS_PREFIX=key

full: genkeys apply

genkeys: 
	./genkeys.sh -n $(KEYS_N) -p $(KEYS_PREFIX)

apply: 
	$(TF) apply -var-file=$(VARSFILE)

plan: 
	$(TF) plan -var-file=$(VARSFILE)

destroy:
	$(TF) destroy -var-file=$(VARSFILE)