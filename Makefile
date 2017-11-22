.PHONY: test
test: install
	python minecraft_deep_learning --mode test

.PHONY: train
train: install
	python minecraft_deep_learning --mode train

.PHONY: play
play: install
	python minecraft_deep_learning --mode play

.PHONY: install
install: build
	pip install -e .

.PHONY: build
build: setup
	coconut setup.coco --no-tco --strict
	coconut "minecraft_deep_learning-source" minecraft_deep_learning --no-tco --strict --jobs sys

.PHONY: setup
setup:
	pip install coconut-develop

.PHONY: clean
clean:
	rm -rf ./dist ./build
	find . -name '*.pyc' -delete
	find . -name '__pycache__' -delete

.PHONY: wipe
wipe: clean
	rm -rf ./minecraft_deep_learning ./stored_weights
	find . -name '*.py' -delete

.PHONY: watch
watch:
	coconut "minecraft_deep_learning-source" minecraft_deep_learning --watch --no-tco --strict
