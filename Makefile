.PHONY: rebuild ubuntu-up debian-up arch-up up-all

rebuild:
	docker compose down
	docker compose up --build -d

ubuntu-up:
	sudo chmod -R 777 ./ubuntu_ar && docker compose up -d ubuntu && docker compose exec -T ubuntu bash -c "cd actions-runner/ && ./run.sh"

debian-up:
	sudo chmod -R 777 ./debian_ar && docker compose up -d debian && docker compose exec -T debian bash -c "cd actions-runner/ && ./run.sh"

arch-up:
	sudo chmod -R 777 ./arch_ar && docker compose up -d arch && docker compose exec -T arch bash -c "cd actions-runner/ && ./run.sh"

# TODO: these don't work well online.