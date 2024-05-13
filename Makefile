.PHONY: deps docker minio common all nginx app

all: deps common docker minio nginx app

common: deps
	ansible-playbook -i inventory.ini playbooks/common.yml --diff

nginx:
	ansible-playbook -i inventory.ini playbooks/nginx.yml --diff

docker: deps
	ansible-playbook -i inventory.ini playbooks/docker.yml --diff

minio: deps
	ansible-playbook -i inventory.ini playbooks/minio.yml --diff

app:
	ansible-playbook -i inventory.ini playbooks/app.yml --diff

deps:
	ansible-galaxy role install -r requirements.yml -p .temp