VARSFILE=terraform.tfvars
TF=terraform
KEYS_N=2
KEYS_PREFIX=salt_ssh

.PHONY: full
full: genkeys apply

.PHONY: genkeys
genkeys:
	./genkeys.sh -n $(KEYS_N) -p $(KEYS_PREFIX)

.PHONY: apply
apply: 
	$(TF) apply -var-file=$(VARSFILE)

.PHONY: plan
plan: 
	$(TF) plan -var-file=$(VARSFILE)

.PHONY: clean
clean:
	$(TF) destroy -var-file=$(VARSFILE)
	rm -rf keys/*