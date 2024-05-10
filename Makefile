.PHONY: deps docker minio common run

run: deps common docker minio

common: deps
	ansible-playbook -i inventory.ini common.yml --diff

docker: deps
	ansible-playbook -i inventory.ini docker.yml --diff

minio: deps
	ansible-playbook -i inventory.ini minio.yml --diff

deps:
	ansible-galaxy role install -r requirements.yml -p .temp