#/bin/sh
for D in cmd/**; do
	if [ -d "${D}" ]; then
    CMD_NAME=$(basename "${D}")
		go build -o $BIN_DIR/$CMD_NAME cmd/$CMD_NAME/main.go;
		echo "  cmd/$CMD_NAME"
	fi
done
