Steps for simulation: 
- module load questa 
- Ensure UVMF_HOME and QUESTA_HOME is added to environment path. Example bash script
        export UVMF_HOME=<destination_directory>
        export PATH=$UVMF_HOME/bin:$PATH
        export QUESTA_HOME=/mnt/apps/public/COE/mg_apps/questa2024.2/questasim
        export PATH=$QUESTA_HOME/bin:$PATH

Regression: 
- Navigate to sim directory - project_benches/lc3/sim 
- make regress 
      - this calls the regress.sh that exists in the sim directory


Directory Navigation for required files

- sim contains the required files
    - transcripts for three test top runs with different seeds 
    - lc3_test_plan_merged.ucdb 
    - lc3_test_plan.xml
    - coverage report named "coverage_report_required.pdf" contains coverage results of covergroup, coverepoints and cross
- verification_ip for all environment and interface packages 