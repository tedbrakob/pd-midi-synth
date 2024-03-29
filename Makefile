# assuming PLAYDATE_SDK_PATH is already set

PDC_PATH="$(PLAYDATE_SDK_PATH)/bin/pdc"
SIMULATOR_PATH="$(PLAYDATE_SDK_PATH)/bin/Playdate Simulator.app"
OUTPUT_PATH="./bin/output.pdx"
PDCFLAGS=

main:
	./.vscode/buildnum.sh
	$(PDC_PATH) $(PDCFLAGS) ./source $(OUTPUT_PATH)

run:
	./.vscode/buildnum.sh
	$(PDC_PATH) $(PDCFLAGS) ./source $(OUTPUT_PATH)
	/usr/bin/open -a $(SIMULATOR_PATH) $(OUTPUT_PATH)
