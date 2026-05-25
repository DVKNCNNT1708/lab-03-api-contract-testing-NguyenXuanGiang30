.PHONY: install lint mock mock-iot mock-vision mock-all test-mock test-local test-html test-ci clean

install:
	npm install

lint:
	npm run lint:contracts

mock: mock-gate

mock-iot:
	npm run mock:iot

mock-vision:
	npm run mock:vision

mock-gate:
	npm run mock:gate

mock-all:
	npm run mock:all

test-mock:
	npm run test:gate-mock

test-local:
	npm run test:gate-local

test-html:
	npm run test:gate-html

test-gate-mock:
	npm run test:gate-mock

test-gate-local:
	npm run test:gate-local

test-gate-html:
	npm run test:gate-html

test-ci:
	npm run test:ci

clean:
	rm -f reports/*.xml reports/*.html reports/*.json prism*.log
