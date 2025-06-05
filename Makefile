build:
	echo "build complete"
	
test:
	pytest tests/counter_tests.py

clean:
	sh clean.sh 

run: 
	python3 bin/systemd_counter.py

build-deb:
	sh install.sh
	sh build_deb.sh

lint-deb: build-deb
	-lintian counter-v2.0.0.deb

docker-image:
	docker build -t counter:latest .

docker-run:
	docker run --rm --mount type=bind,source=/tmp,target=/tmp counter:latest