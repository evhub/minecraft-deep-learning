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

.PHONY: play
play: install
	python minecraft_deep_learning --mode play

.PHONY: train
train: install
	python minecraft_deep_learning --mode train

.PHONY: test
test: install
	python minecraft_deep_learning --mode test

.PHONY: clean
clean:
	rm -rf ./dist ./build ./minecraft_deep_learning
	find . -name '*.pyc' -delete
	find . -name '__pycache__' -delete
	find . -name '*.py' -delete

.PHONY: wipe
wipe: clean
	rm -rf ./saved_weights ./saved_data ./saved_images

.PHONY: watch
watch:
	coconut "minecraft_deep_learning-source" minecraft_deep_learning --watch --no-tco --strict

.PHONY: quiver
quiver: install
	python minecraft_deep_learning --mode quiver

.PHONY: tensorboard
tensorboard:
	open http://localhost:6006
	tensorboard --logdir=./saved_data
