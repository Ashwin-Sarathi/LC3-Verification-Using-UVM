
make clean
# rm -rf *.ucdb

make cli TEST_NAME=test_top +TEST_SEED=64234323 UVM_CLI_ARGS="+UVM_VERBOSITY=UVM_LOW"
make run_cli TEST_NAME=test_top +TEST_SEED=4532234 UVM_CLI_ARGS="+UVM_VERBOSITY=UVM_LOW"
make run_cli TEST_NAME=test_top +TEST_SEED=78322389 UVM_CLI_ARGS="+UVM_VERBOSITY=UVM_LOW"

make merge_coverage
make view_coverage
# make rank_coverage
