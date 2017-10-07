#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail
set -o xtrace

service_container_name=${SERVICE_CONTAINER_NAME:-thirugu_baana_service}
run_mode=${RUN_MODE:-interactive}
service_docker_image=${SERVICE_DOCKER_IMAGE:-abhijith/thirugu-baana}


start() {
    case "$run_mode" in
        interactive)
            run_mode_flag="-it"
            ;;
        daemon)
            run_mode_flag="-d"
            ;;
        *)
            echo $"Invalid run mode, expected one of {interactive|daemon}"
            exit -1
    esac

    sudo docker run \
        -p 8080:8080 \
        --name "$service_container_name" \
        "${run_mode_flag}" \
        "${service_docker_image}"
}

stop() {
    sudo docker rm -f "${service_container_name}" || true
}

restart() {
    stop
    start
}

case "$1" in
    start)
        start
        ;;
    stop)
        stop
        ;;
    restart)
        restart
        ;;
    *)
        echo $"usage: $0 {start|stop|restart}"
        exit 1
esac