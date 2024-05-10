.PHONY: common, deps, nginx

common:
	ansible-playbook -i inventory.ini playbook.yml --diff

deps:
	ansible-galaxy role install -r requirements.yml -p .temp