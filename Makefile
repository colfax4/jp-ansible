SHELL := /bin/bash

ANSIBLE_PLAYBOOK_BASE=ansible-playbook -i inventory/

ifdef CI
ANSIBLE_PLAYBOOK=$(ANSIBLE_PLAYBOOK_BASE) --user=ansible --private-key=/root/.ssh/ansible
else
ANSIBLE_PLAYBOOK=$(ANSIBLE_PLAYBOOK_BASE)
endif

.PHONY: ping

ping:
	$(ANSIBLE_PLAYBOOK) playbooks/ping.yml

bootstrap: 
	$(ANSIBLE_PLAYBOOK) playbooks/bootstrap.yml

config:
	$(ANSIBLE_PLAYBOOK) --ssh-extra-args '-o ForwardX11=yes' playbooks/config.yml

software:
	$(ANSIBLE_PLAYBOOK) playbooks/software.yml
