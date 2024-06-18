GO = go
WASM_EXEC_PATH := $(shell $(GO) env GOROOT)/misc/wasm/wasm_exec.js

build: ../wasm_exec.js
	GOOS=js GOARCH=wasm $(GO) build -o main.wasm

wasm_exec.js:
	@powershell -Command "Copy-Item -Path '$(WASM_EXEC_PATH)' -Destination . -Force"

clean:
	del main.wasm wasm_exec.js
