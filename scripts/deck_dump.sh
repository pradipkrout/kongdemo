 #!/bin/bash
 [ $? -eq 0 ] || exit
while getopts "U:P:J:I:" flag
    do
             case "${flag}" in
                    U) TEST_USER=${OPTARG};;
                    P) TEST_PWD=${OPTARG};;
                    J) TEST_JOBID=${OPTARG};;
                    I) TEST_PROJECTID=${OPTARG};;
             esac
    done
    echo "USER: $TEST_USER";
    echo "PWD: $TEST_PWD";
    echo "JOBID: $TEST_JOBID";
    echo "PROJECTID: $TEST_PROJECTID";
