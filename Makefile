.PHONY: rebuild reactivate

rebuild:
	docker compose down
	docker compose up --build -d

reactivate:
	sudo chmod -R 777 ./ubuntu_ar
	sudo chmod -R 777 ./debian_ar
	sudo chmod -R 777 ./arch_ar
	docker compose up -d
	docker compose exec -T ubuntu bash -c "cd actions-runner/ && nohup ./run.sh > /dev/null 2>&1 &" &
	docker compose exec -T debian bash -c "cd actions-runner/ && nohup ./run.sh > /dev/null 2>&1 &" &
	docker compose exec -T arch bash -c "cd actions-runner/ && nohup ./run.sh > /dev/null 2>&1 &" &
	wait